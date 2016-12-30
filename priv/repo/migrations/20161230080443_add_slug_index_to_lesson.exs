defmodule LearnReact.Repo.Migrations.AddSlugIndexToLesson do
  use Ecto.Migration

  def change do
    create unique_index(:lessons, [:slug])
  end
end
