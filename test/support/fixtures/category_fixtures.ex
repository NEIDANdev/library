defmodule Alexandria.CategoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Alexandria.Category` context.
  """

  @doc """
  Generate a genre.
  """
  def genre_fixture(attrs \\ %{}) do
    {:ok, genre} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Alexandria.Category.create_genre()

    genre
  end
end
