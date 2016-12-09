defmodule LearnReact.Repo.Migrations.CreateCharge do
  use Ecto.Migration

  def change do
    create table(:charges) do
      add :email, :string
      add :token, :string
      add :tokenType, :string

      timestamps()
    end

  end
end
