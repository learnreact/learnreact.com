defmodule LearnReact.Lesson do
  use LearnReact.Web, :model

  schema "lessons" do
    field :title, :string
    field :description, :string
    field :video_embed, :string
    field :thumbnail_url, :string
    field :notes, :string
    field :hidden, :boolean, default: false
    field :slug, :string

    belongs_to :course, LearnReact.Course

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :video_embed, :thumbnail_url, :notes, :hidden, :course_id])
    |> validate_required([:title, :description, :video_embed, :thumbnail_url, :hidden, :course_id])
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

defimpl Phoenix.Param, for: LearnReact.Lesson do
  def to_param(%{slug: slug}) do
    slug
  end
end
