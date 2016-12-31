defmodule LearnReact.PageName do
  alias LearnReact.{
    LessonView,
    CourseView
  }

  def page_name(assigns), do: assigns |> get

  defp get(%{ view_module: CourseView, view_template: "show.html", course: course }) do
    course.title
  end
  defp get(%{ view_module: LessonView, view_template: "show.html", lesson: lesson }) do
    lesson.title
  end
  defp get(_), do: "Learn React"
end
