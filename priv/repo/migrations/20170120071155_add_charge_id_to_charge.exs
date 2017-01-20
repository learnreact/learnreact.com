defmodule LearnReact.Repo.Migrations.AddChargeIdToCharge do
  use Ecto.Migration

  def change do
    alter table(:charges) do
      add :charge_id, :string
    end
  end
end
