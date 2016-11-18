defmodule LearnReact.Lesson do
  use LearnReact.Web, :model

  schema "lessons" do
    field :title, :string
    field :description, :string
    field :video_embed, :string
    field :thumbnail_url, :string
    field :notes, :string
    field :hidden, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :video_embed, :thumbnail_url, :notes, :hidden])
    |> validate_required([:title, :description, :video_embed, :thumbnail_url, :notes, :hidden])
  end
end
