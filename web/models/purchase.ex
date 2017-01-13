defmodule LearnReact.Purchase do
  use LearnReact.Web, :model

  schema "purchases" do
    field :user_id, :integer
    field :course_id, :integer
    field :charge_id, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :course_id, :charge_id])
    |> validate_required([:user_id, :course_id, :charge_id])
  end
end
