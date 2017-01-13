defmodule LearnReact.PurchaseTest do
  use LearnReact.ModelCase

  alias LearnReact.Purchase

  @valid_attrs %{charge_id: 42, course_id: 42, user_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Purchase.changeset(%Purchase{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Purchase.changeset(%Purchase{}, @invalid_attrs)
    refute changeset.valid?
  end
end
