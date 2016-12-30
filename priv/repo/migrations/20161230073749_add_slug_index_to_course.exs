defmodule LearnReact.Repo.Migrations.AddSlugIndexToCourse do
  use Ecto.Migration

  def change do
    create unique_index(:courses, [:slug])
  end
end
