defmodule UploadsPhoenix.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `UploadsPhoenix.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        image: "some image",
        title: "some title"
      })
      |> UploadsPhoenix.Posts.create_post()

    post
  end
end
