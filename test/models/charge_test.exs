defmodule LearnReact.ChargeTest do
  use LearnReact.ModelCase

  alias LearnReact.Charge

  @valid_attrs %{email: "some content", token: "some content", tokenType: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Charge.changeset(%Charge{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Charge.changeset(%Charge{}, @invalid_attrs)
    refute changeset.valid?
  end
end
