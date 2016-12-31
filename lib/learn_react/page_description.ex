defmodule LearnReact.PageDescription do
  alias LearnReact.{
    LessonView,
    CourseView
  }

  def page_description(assigns), do: assigns |> get

  defp get(%{ view_module: CourseView, view_template: "show.html", course: course }) do
    course.description # course.title
  end
  defp get(%{ view_module: LessonView, view_template: "show.html", lesson: lesson }) do
    lesson.description
  end
  defp get(_), do: "Learn React — 15 video courses on React.js, only $5 each."
end
