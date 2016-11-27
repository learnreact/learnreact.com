defmodule LearnReact.Course do
  use LearnReact.Web, :model

  schema "courses" do
    field :title, :string
    field :description, :string
    field :thumbnail_url, :string
    field :hidden, :boolean, default: false

    timestamps()

    has_many :lessons, LearnReact.Lesson
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :thumbnail_url, :hidden])
    |> validate_required([:title, :description, :thumbnail_url, :hidden])
  end
end
