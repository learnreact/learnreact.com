defmodule LearnReact.ChargeController do
  use LearnReact.Web, :controller

  alias LearnReact.Charge

  def index(conn, _params) do
    charges = Repo.all(Charge)
    render(conn, "index.html", charges: charges)
  end

  def create(conn, %{
    "stripeEmail" => email,
    "stripeToken" => token,
    "stripeTokenType" => tokenType, # TODO: underscore case this
    "course_id" => course_id,
    "course_slug" => course_slug
  }) do
    case Stripe.post("/charges", {:form, [
      {"amount", "500"},
      {"currency", "USD"},
      {"source", token}]},
      [{"Authorization", "Bearer #{System.get_env("STRIPE_SECRET")}"}
    ]) do
      {:ok, %HTTPoison.Response{status_code: 200, "body": body}} ->
        changeset = Charge.changeset(%Charge{}, %{
          email: email,
          token: token,
          tokenType: tokenType,
          charge_id: body[:id],
        })

        case Repo.insert(changeset) do
          {:ok, _charge} ->
            conn
            |> put_flash(:info, "Your course hase been purchased. Enjoy!")
            |> redirect(to: course_path(conn, :show, course_slug))
          {:error, changeset} ->
            render(conn, "new.html", changeset: changeset)
        end
      {:error, %HTTPoison.Error{reason: reason}} ->
        conn
        |> put_flash(:error, "There was an error charging your card. Please try again.")
        |> redirect(to: course_path(conn, :show, course_slug))
    end
  end

  def show(conn, %{"id" => id}) do
    charge = Repo.get!(Charge, id)
    render(conn, "show.html", charge: charge)
  end
end
