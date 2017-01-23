defmodule LearnReact.ChargeController do
  use LearnReact.Web, :controller

  alias LearnReact.{
    Charge,
    Purchase,
  }

  alias Ecto.Multi

  def index(conn, _params) do
    charges = Repo.all(Charge)
    render(conn, "index.html", charges: charges)
  end

  def create(conn, %{
    "stripeToken" => token,
    "course_slug" => course_slug
  } = params) do
    case Stripe.post("/charges", {:form, [
      {"amount", "500"},
      {"currency", "USD"},
      {"source", token}]},
      [{"Authorization", "Bearer #{System.get_env("STRIPE_SECRET")}"}
    ]) do
      {:ok, %HTTPoison.Response{status_code: 200, "body": body}} ->
        case record_purchase(params, body[:id], conn.assigns[:current_user]) do
          {:ok, %{charge: _, purchase: _}} ->
            conn
            |> put_flash(:info, "Your course has been purchased. Enjoy!")
            |> redirect(to: course_path(conn, :show, course_slug))

          # TODO: handle errors
          {:error, :charge, failed_value, _changes_successful} ->
            raise  failed_value
          {:error, :purchase, failed_value, _changes_successful} ->
            raise  failed_value
        end

      {:error, %HTTPoison.Error{reason: _}} ->
        conn
        |> put_flash(:error, "There was an error charging your card. Please try again.")
        |> redirect(to: course_path(conn, :show, course_slug))
    end
  end

  def record_purchase(%{
    "stripeEmail" => email,
    "stripeToken" => token,
    "stripeTokenType" => tokenType, # TODO: underscore case this
    "course_id" => course_id,
  }, charge_id, current_user) do
    changeset = Charge.changeset(%Charge{}, %{
      email: email,
      token: token,
      tokenType: tokenType,
      charge_id: charge_id,
    })

    Multi.new
    |> Multi.insert(:charge, changeset)
    |> Multi.run(:purchase, fn(result) ->
      Repo.insert(Purchase.changeset(%Purchase{}, %{
        user_id: current_user.id,
        course_id: course_id,
        charge_id: result.charge.id,
      }))
    end)
    |> Repo.transaction()
  end

  def show(conn, %{"id" => id}) do
    charge = Repo.get!(Charge, id)
    render(conn, "show.html", charge: charge)
  end
end
