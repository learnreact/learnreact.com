defmodule LearnReact.PurchaseControllerTest do
  use LearnReact.ConnCase

  alias LearnReact.Purchase
  @valid_attrs %{charge_id: 42, course_id: 42, user_id: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, purchase_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing purchases"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, purchase_path(conn, :new)
    assert html_response(conn, 200) =~ "New purchase"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, purchase_path(conn, :create), purchase: @valid_attrs
    assert redirected_to(conn) == purchase_path(conn, :index)
    assert Repo.get_by(Purchase, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, purchase_path(conn, :create), purchase: @invalid_attrs
    assert html_response(conn, 200) =~ "New purchase"
  end

  test "shows chosen resource", %{conn: conn} do
    purchase = Repo.insert! %Purchase{}
    conn = get conn, purchase_path(conn, :show, purchase)
    assert html_response(conn, 200) =~ "Show purchase"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, purchase_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    purchase = Repo.insert! %Purchase{}
    conn = get conn, purchase_path(conn, :edit, purchase)
    assert html_response(conn, 200) =~ "Edit purchase"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    purchase = Repo.insert! %Purchase{}
    conn = put conn, purchase_path(conn, :update, purchase), purchase: @valid_attrs
    assert redirected_to(conn) == purchase_path(conn, :show, purchase)
    assert Repo.get_by(Purchase, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    purchase = Repo.insert! %Purchase{}
    conn = put conn, purchase_path(conn, :update, purchase), purchase: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit purchase"
  end

  test "deletes chosen resource", %{conn: conn} do
    purchase = Repo.insert! %Purchase{}
    conn = delete conn, purchase_path(conn, :delete, purchase)
    assert redirected_to(conn) == purchase_path(conn, :index)
    refute Repo.get(Purchase, purchase.id)
  end
end
