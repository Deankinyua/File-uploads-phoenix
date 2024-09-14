defmodule UploadsPhoenix.Posts.Post do
  use Ecto.Schema

  use Waffle.Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :body, :string
    field :image, UploadsPhoenix.Uploaders.ImageUploader.Type

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> cast_attachments(attrs, [:image], allow_paths: true)
    |> validate_required([:title, :body])
  end
end
