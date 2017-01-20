defmodule LearnReact.Purchase do
  use LearnReact.Web, :model

  schema "purchases" do
    belongs_to :user, LearnReact.User
    belongs_to :course, LearnReact.Course
    belongs_to :charge, LearnReact.Charge

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
