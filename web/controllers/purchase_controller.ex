defmodule LearnReact.PurchaseController do
  use LearnReact.Web, :controller

  alias LearnReact.Purchase

  def index(conn, _params) do
    purchases = Repo.all(Purchase)
    render(conn, "index.html", purchases: purchases)
  end

  def new(conn, _params) do
    changeset = Purchase.changeset(%Purchase{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"purchase" => purchase_params}) do
    changeset = Purchase.changeset(%Purchase{}, purchase_params)

    case Repo.insert(changeset) do
      {:ok, _purchase} ->
        conn
        |> put_flash(:info, "Purchase created successfully.")
        |> redirect(to: purchase_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    purchase = Repo.get!(Purchase, id)
    render(conn, "show.html", purchase: purchase)
  end

  def edit(conn, %{"id" => id}) do
    purchase = Repo.get!(Purchase, id)
    changeset = Purchase.changeset(purchase)
    render(conn, "edit.html", purchase: purchase, changeset: changeset)
  end

  def update(conn, %{"id" => id, "purchase" => purchase_params}) do
    purchase = Repo.get!(Purchase, id)
    changeset = Purchase.changeset(purchase, purchase_params)

    case Repo.update(changeset) do
      {:ok, purchase} ->
        conn
        |> put_flash(:info, "Purchase updated successfully.")
        |> redirect(to: purchase_path(conn, :show, purchase))
      {:error, changeset} ->
        render(conn, "edit.html", purchase: purchase, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    purchase = Repo.get!(Purchase, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(purchase)

    conn
    |> put_flash(:info, "Purchase deleted successfully.")
    |> redirect(to: purchase_path(conn, :index))
  end
end
