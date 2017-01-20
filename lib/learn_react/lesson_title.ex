defmodule LearnReact.LessonTitle do
  alias LearnReact.LessonView

  def lesson_title(assigns), do: get(assigns)

  defp get(%{ lesson: lesson }) do
    lesson.title
  end

  defp get(_), do: nil
end
