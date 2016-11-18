defmodule LearnReact.LessonControllerTest do
  use LearnReact.ConnCase

  alias LearnReact.Lesson
  @valid_attrs %{description: "some content", hidden: true, notes: "some content", thumbnail_url: "some content", title: "some content", video_embed: "some content"}
  @invalid_attrs %{}

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, lesson_path(conn, :show, -1)
    end
  end
end
