defmodule LearnReact.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :github_id, :integer
      add :name, :string
      add :email, :string
      add :avatar_url, :string

      timestamps()
    end

  end
end
