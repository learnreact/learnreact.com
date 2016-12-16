defmodule LearnReact.Lesson do
  use LearnReact.Web, :model

  @primary_key {:id, LearnReact.Permalink, autogenerate: true}

  schema "lessons" do
    field :title, :string
    field :description, :string
    field :video_embed, :string
    field :thumbnail_url, :string
    field :notes, :string
    field :hidden, :boolean, default: false

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
  end
end

defimpl Phoenix.Param, for: LearnReact.Lesson do
  alias LearnReact.Inflectors

  def to_param(%{id: id, title: title}) do
    "#{id}-#{Inflectors.parameterize(title)}"
  end
end
