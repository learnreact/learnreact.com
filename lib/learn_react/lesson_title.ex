defmodule LearnReact.LessonTitle do
  def lesson_title(assigns), do: get(assigns)

  defp get(%{ lesson: lesson }) do
    lesson.title
  end

  defp get(_), do: nil
end
