defmodule LearnReact.CourseTest do
  use LearnReact.ModelCase

  alias LearnReact.Course

  @valid_attrs %{description: "some content", hidden: true, thumbnail_url: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Course.changeset(%Course{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Course.changeset(%Course{}, @invalid_attrs)
    refute changeset.valid?
  end
end
