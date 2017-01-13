defmodule LearnReact.Repo.Migrations.AddFreeToLesson do
  use Ecto.Migration

  def change do
    alter table(:lessons) do
      add :free, :boolean, default: false, null: false
    end

  end
end
