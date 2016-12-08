defmodule LearnReact.Repo.Migrations.AddCourseReferenceToLesson do
  use Ecto.Migration

  def change do
    alter table(:lessons) do
      add :course_id, references(:courses, on_delete: :nothing)
    end
    create index(:lessons, [:course_id])

  end
end
