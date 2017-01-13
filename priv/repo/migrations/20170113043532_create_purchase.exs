defmodule LearnReact.Repo.Migrations.CreatePurchase do
  use Ecto.Migration

  def change do
    create table(:purchases) do
      add :user_id, :integer
      add :course_id, :integer
      add :charge_id, :integer

      timestamps()
    end

  end
end
