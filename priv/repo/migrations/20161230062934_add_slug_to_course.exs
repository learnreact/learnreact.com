defmodule LearnReact.Repo.Migrations.AddSlugToCourse do
  use Ecto.Migration

  def change do
    alter table(:courses) do
      add :slug, :string
    end
  end
end
