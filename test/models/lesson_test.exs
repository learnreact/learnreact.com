defmodule LearnReact.LessonTest do
  use LearnReact.ModelCase

  alias LearnReact.Lesson

  @valid_attrs %{description: "some content", hidden: true, notes: "some content", thumbnail_url: "some content", title: "some content", video_embed: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Lesson.changeset(%Lesson{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Lesson.changeset(%Lesson{}, @invalid_attrs)
    refute changeset.valid?
  end
end
