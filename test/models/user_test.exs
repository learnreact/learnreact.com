defmodule LearnReact.UserTest do
  use LearnReact.ModelCase

  alias LearnReact.User

  @valid_attrs %{avatar_url: "some content", email: "some content", github_id: 42, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
