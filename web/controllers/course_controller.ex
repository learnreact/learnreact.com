defmodule LearnReact.CourseController do
  use LearnReact.Web, :controller

  alias LearnReact.Course
  alias LearnReact.Lesson

  def index(conn, _params) do
    lessons_query = from(l in Lesson, order_by: [asc: :id])
    courses = Repo.all(from c in Course, where: c.hidden != true, preload: [lessons: ^lessons_query])
    render(conn, "index.html", courses: courses)
  end

  def new(conn, _params) do
    changeset = Course.changeset(%Course{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"course" => course_params}) do
    changeset = Course.changeset(%Course{}, course_params)

    case Repo.insert(changeset) do
      {:ok, _course} ->
        conn
        |> put_flash(:info, "Course created successfully.")
        |> redirect(to: course_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => slug}) do
    course = Repo.get_by!(Course, slug: slug)
    |> Repo.preload([lessons: from(l in Lesson, order_by: [asc: :id])])
    render(conn, "show.html", course: course)
  end

  def edit(conn, %{"id" => slug}) do
    course = Repo.get_by!(Course, slug: slug)
    changeset = Course.changeset(course)
    render(conn, "edit.html", course: course, changeset: changeset)
  end

  def update(conn, %{"id" => slug, "course" => course_params}) do
    course = Repo.get_by!(Course, slug: slug)
    changeset = Course.changeset(course, course_params)

    case Repo.update(changeset) do
      {:ok, course} ->
        conn
        |> put_flash(:info, "Course updated successfully.")
        |> redirect(to: course_path(conn, :show, course))
      {:error, changeset} ->
        render(conn, "edit.html", course: course, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => slug}) do
    course = Repo.get_by!(Course, slug: slug)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(course)

    conn
    |> put_flash(:info, "Course deleted successfully.")
    |> redirect(to: course_path(conn, :index))
  end
end
