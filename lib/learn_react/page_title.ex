defmodule LearnReact.PageTitle do
  alias LearnReact.{
    LessonView,
    CourseView
  }

  @suffix "Learn React"

  def page_title(assigns), do: assigns |> get |> put_suffix

  defp put_suffix(nil), do: @suffix
  defp put_suffix(title), do: title <> " - " <> @suffix

  defp get(%{ view_module: CourseView, view_template: "index.html" }) do
     "Learn React — 15 video courses on React.js, only $5 each."
  end
  defp get(%{ view_module: CourseView, view_template: "show.html", course: course }) do
    course.title
  end
  defp get(%{ view_module: LessonView, view_template: "show.html", lesson: lesson }) do
    lesson.title <> " - " <> lesson.course.title
  end
  defp get(_), do: nil
end
