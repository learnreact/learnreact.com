defmodule LearnReact.LessonController do
  use LearnReact.Web, :controller

  alias LearnReact.Lesson
  alias LearnReact.Course

  plug :require_ownership, "user" when action in [:new, :create, :edit, :update, :delete]

  defp require_ownership(conn, _params) do
    user = get_session(conn, :current_user)

    if user && user.github_id == 658360 do
      conn
    else
      conn
      |> redirect(to: "/")
    end
  end

  def index(conn, _params) do
    lessons = Repo.all(Lesson)
    render(conn, "index.html", lessons: lessons)
  end

  def new(conn, _params) do
    changeset = Lesson.changeset(%Lesson{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"lesson" => lesson_params}) do
    changeset =
      Repo.get!(Course, lesson_params["course"]["id"])
      |> build_assoc(:lessons)
      |> Lesson.changeset(lesson_params)

    case Repo.insert(changeset) do
      {:ok, _lesson} ->
        conn
        |> put_flash(:info, "Lesson created successfully.")
        |> redirect(to: lesson_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    lesson = Repo.get!(Lesson, id)
    |> Repo.preload([:course])
    render(conn, "show.html", lesson: lesson)
  end

  def edit(conn, %{"id" => id}) do
    lesson = Repo.get!(Lesson, id)
    |> Repo.preload([:course])
    changeset = Lesson.changeset(lesson)
    render(conn, "edit.html", lesson: lesson, changeset: changeset)
  end

  def update(conn, %{"id" => id, "lesson" => lesson_params}) do
    # video = Repo.get!(user_videos(user), id)
    # changeset = Video.changeset(video, video_params)
    # case Repo.update(changeset) do {:ok, video} ->
    # conn
    # |> put_flash(:info, "Video updated successfully.") |> redirect(to: video_path(conn, :show, video))
    # {:error, changeset} ->
    # render(conn, "edit.html", video: video, changeset: changeset)
    # end

    course = Repo.get!(Course, lesson_params["course"]["id"])
    lesson = Repo.get!(assoc(course, :lessons), id)
    changeset = Lesson.changeset(lesson, lesson_params)

    case Repo.update(changeset) do
      {:ok, lesson} ->
        conn
        |> put_flash(:info, "Lesson updated successfully.")
        |> redirect(to: lesson_path(conn, :show, lesson))
      {:error, changeset} ->
        render(conn, "edit.html", lesson: lesson, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    lesson = Repo.get!(Lesson, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(lesson)

    conn
    |> put_flash(:info, "Lesson deleted successfully.")
    |> redirect(to: lesson_path(conn, :index))
  end
end
