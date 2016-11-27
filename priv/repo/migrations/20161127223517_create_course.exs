defmodule LearnReact.Repo.Migrations.CreateCourse do
  use Ecto.Migration

  def change do
    create table(:courses) do
      add :title, :string
      add :description, :text
      add :thumbnail_url, :string
      add :hidden, :boolean, default: false, null: false

      timestamps()
    end

  end
end
