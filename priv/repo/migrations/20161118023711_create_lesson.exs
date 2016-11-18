defmodule LearnReact.Repo.Migrations.CreateLesson do
  use Ecto.Migration

  def change do
    create table(:lessons) do
      add :title, :string
      add :description, :text
      add :video_embed, :text
      add :thumbnail_url, :string
      add :notes, :text
      add :hidden, :boolean, default: false, null: false

      timestamps()
    end

  end
end
