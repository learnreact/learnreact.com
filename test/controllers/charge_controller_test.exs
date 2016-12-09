defmodule LearnReact.ChargeControllerTest do
  use LearnReact.ConnCase

  alias LearnReact.Charge
  @valid_attrs %{email: "some content", token: "some content", tokenType: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, charge_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing charges"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, charge_path(conn, :new)
    assert html_response(conn, 200) =~ "New charge"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, charge_path(conn, :create), charge: @valid_attrs
    assert redirected_to(conn) == charge_path(conn, :index)
    assert Repo.get_by(Charge, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, charge_path(conn, :create), charge: @invalid_attrs
    assert html_response(conn, 200) =~ "New charge"
  end

  test "shows chosen resource", %{conn: conn} do
    charge = Repo.insert! %Charge{}
    conn = get conn, charge_path(conn, :show, charge)
    assert html_response(conn, 200) =~ "Show charge"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, charge_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    charge = Repo.insert! %Charge{}
    conn = get conn, charge_path(conn, :edit, charge)
    assert html_response(conn, 200) =~ "Edit charge"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    charge = Repo.insert! %Charge{}
    conn = put conn, charge_path(conn, :update, charge), charge: @valid_attrs
    assert redirected_to(conn) == charge_path(conn, :show, charge)
    assert Repo.get_by(Charge, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    charge = Repo.insert! %Charge{}
    conn = put conn, charge_path(conn, :update, charge), charge: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit charge"
  end

  test "deletes chosen resource", %{conn: conn} do
    charge = Repo.insert! %Charge{}
    conn = delete conn, charge_path(conn, :delete, charge)
    assert redirected_to(conn) == charge_path(conn, :index)
    refute Repo.get(Charge, charge.id)
  end
end
