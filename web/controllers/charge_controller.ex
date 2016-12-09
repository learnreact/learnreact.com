defmodule LearnReact.ChargeController do
  use LearnReact.Web, :controller

  alias LearnReact.Charge

  def index(conn, _params) do
    charges = Repo.all(Charge)
    render(conn, "index.html", charges: charges)
  end

  def new(conn, _params) do
    changeset = Charge.changeset(%Charge{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"stripeEmail" => email, "stripeToken" => token, "stripeTokenType" => tokenType}) do
    changeset = Charge.changeset(%Charge{}, %{
      email: email,
      token: token,
      tokenType: tokenType,
    })

    case Repo.insert(changeset) do
      {:ok, _charge} ->
        conn
        |> put_flash(:info, "Charge created successfully.")
        |> redirect(to: charge_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
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
