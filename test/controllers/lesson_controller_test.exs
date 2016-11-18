defmodule LearnReact.LessonControllerTest do
  use LearnReact.ConnCase

  alias LearnReact.Lesson
  @valid_attrs %{description: "some content", hidden: true, notes: "some content", thumbnail_url: "some content", title: "some content", video_embed: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, lesson_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing lessons"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, lesson_path(conn, :new)
    assert html_response(conn, 200) =~ "New lesson"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, lesson_path(conn, :create), lesson: @valid_attrs
    assert redirected_to(conn) == lesson_path(conn, :index)
    assert Repo.get_by(Lesson, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, lesson_path(conn, :create), lesson: @invalid_attrs
    assert html_response(conn, 200) =~ "New lesson"
  end

  test "shows chosen resource", %{conn: conn} do
    lesson = Repo.insert! %Lesson{}
    conn = get conn, lesson_path(conn, :show, lesson)
    assert html_response(conn, 200) =~ "Show lesson"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, lesson_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    lesson = Repo.insert! %Lesson{}
    conn = get conn, lesson_path(conn, :edit, lesson)
    assert html_response(conn, 200) =~ "Edit lesson"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    lesson = Repo.insert! %Lesson{}
    conn = put conn, lesson_path(conn, :update, lesson), lesson: @valid_attrs
    assert redirected_to(conn) == lesson_path(conn, :show, lesson)
    assert Repo.get_by(Lesson, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    lesson = Repo.insert! %Lesson{}
    conn = put conn, lesson_path(conn, :update, lesson), lesson: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit lesson"
  end

  test "deletes chosen resource", %{conn: conn} do
    lesson = Repo.insert! %Lesson{}
    conn = delete conn, lesson_path(conn, :delete, lesson)
    assert redirected_to(conn) == lesson_path(conn, :index)
    refute Repo.get(Lesson, lesson.id)
  end
end
