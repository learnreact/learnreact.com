defmodule LearnReact.CourseTitle do
  alias LearnReact.CourseView

  def course_title(assigns), do: get(assigns)

  defp get(%{ course: course }) do
    course.title
  end

  defp get(_), do: nil
end
