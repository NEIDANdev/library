defmodule Alexandria.LibraryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Alexandria.Library` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        published_at: ~U[2024-07-24 23:46:00Z],
        title: "some title"
      })
      |> Alexandria.Library.create_book()

    book
  end
end
