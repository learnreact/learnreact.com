defmodule LearnReact.Repo.Migrations.AddDraftToCourse do
  use Ecto.Migration

  def change do
    alter table(:courses) do
      add :draft, :boolean, default: false, null: false
    end

  end
end
