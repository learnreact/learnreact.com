defmodule LearnReact.User do
  use LearnReact.Web, :model

  schema "users" do
    field :github_id, :integer
    field :name, :string
    field :email, :string
    field :avatar_url, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:github_id, :name, :email, :avatar_url])
    |> validate_required([:github_id, :name, :email, :avatar_url])
  end
end
