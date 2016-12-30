defmodule LearnReact.Repo.Migrations.AddSlugToLesson do
  use Ecto.Migration

  def change do
    alter table(:lessons) do
      add :slug, :string
    end
  end
end
