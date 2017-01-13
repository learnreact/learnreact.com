defmodule LearnReact.Repo.Migrations.AddFreeToCourse do
  use Ecto.Migration

  def change do
    alter table(:courses) do
      add :free, :boolean, default: false, null: false
    end

  end
end
