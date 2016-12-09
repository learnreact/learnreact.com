defmodule LearnReact.Charge do
  use LearnReact.Web, :model

  schema "charges" do
    field :email, :string
    field :token, :string
    field :tokenType, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :token, :tokenType])
    |> validate_required([:email, :token, :tokenType])
  end
end
