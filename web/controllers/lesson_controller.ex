defmodule LearnReact.LessonController do
  use LearnReact.Web, :controller

  alias LearnReact.Lesson

  def index(conn, _params) do
    lessons = Repo.all(Lesson)
    render(conn, "index.html", lessons: lessons)
  end

  def show(conn, %{"id" => id}) do
    lesson = Repo.get!(Lesson, id)
    render(conn, "show.html", lesson: lesson)
  end
end
