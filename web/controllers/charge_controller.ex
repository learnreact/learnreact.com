defmodule LearnReact.ChargeController do
  use LearnReact.Web, :controller

  alias LearnReact.Charge

  plug :require_ownership, "user" when action in [:index, :new, :create, :edit, :update, :delete]

  defp require_ownership(conn, _params) do
    user = get_session(conn, :current_user)

    if user && user.github_id == 658360 do
      conn
    else
      conn
      |> redirect(to: "/")
    end
  end

  def index(conn, _params) do
    charges = Repo.all(Charge)
    render(conn, "index.html", charges: charges)
  end

  def new(conn, _params) do
    changeset = Charge.changeset(%Charge{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"stripeEmail" => email, "stripeToken" => token, "stripeTokenType" => tokenType, "course_id" => course_id, "course_slug" => course_slug}) do
    changeset = Charge.changeset(%Charge{}, %{
      email: email,
      token: token,
      tokenType: tokenType,
    })

    case Stripe.post("/charges", {:form, [{"amount", "500"}, {"currency", "USD"}, {"source", token}]}, [{"Authorization", "Bearer #{System.get_env("STRIPE_SECRET")}"}]) do
      {:ok, %HTTPoison.Response{status_code: 200, "body": body}} ->
        IO.puts body[:id]
        IO.puts body[:url]
        IO.puts course_id

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

  def edit(conn, %{"id" => id}) do
    charge = Repo.get!(Charge, id)
    changeset = Charge.changeset(charge)
    render(conn, "edit.html", charge: charge, changeset: changeset)
  end

  def update(conn, %{"id" => id, "charge" => charge_params}) do
    charge = Repo.get!(Charge, id)
    changeset = Charge.changeset(charge, charge_params)

    case Repo.update(changeset) do
      {:ok, charge} ->
        conn
        |> put_flash(:info, "Charge updated successfully.")
        |> redirect(to: charge_path(conn, :show, charge))
      {:error, changeset} ->
        render(conn, "edit.html", charge: charge, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    charge = Repo.get!(Charge, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(charge)

    conn
    |> put_flash(:info, "Charge deleted successfully.")
    |> redirect(to: charge_path(conn, :index))
  end
end
