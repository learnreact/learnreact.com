defmodule LearnReact.Course do
  use LearnReact.Web, :model

  schema "courses" do
    field :title, :string
    field :description, :string
    field :thumbnail_url, :string
    field :hidden, :boolean, default: false
    field :draft, :boolean, default: false
    field :slug, :string

    timestamps()

    has_many :lessons, LearnReact.Lesson
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :thumbnail_url, :hidden, :draft])
    |> validate_required([:title, :description, :thumbnail_url, :hidden, :draft])
    |> slugify_title()
    |> unique_constraint(:slug)
  end

  @doc """
  Modifies the changeset to use slugify'd title.
  """
  defp slugify_title(changeset) do
    if title = get_change(changeset, :title) do
      put_change(changeset, :slug, slugify(title))
    else
      changeset
    end
  end

  @doc """
  Returns title slug for friendly URLs
  """
  defp slugify(str) do
    alias LearnReact.Inflectors

    Inflectors.parameterize(str)
  end
end

defimpl Phoenix.Param, for: LearnReact.Course do
  def to_param(%{slug: slug}) do
    slug
  end
end
