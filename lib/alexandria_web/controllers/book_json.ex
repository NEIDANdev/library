defmodule AlexandriaWeb.BookJSON do
  alias Alexandria.Library.Book

  @doc """
  Renders a list of books.
  """
  def index(%{books: books}) do
    %{data: for(book <- books, do: data(book))}
  end

  @doc """
  Renders a single book.
  """
  def show(%{book: book}) do
    %{data: data(book)}
  end

  defp data(%Book{} = book) do
    %{
      id: book.id,
      title: book.title,
      published_at: book.published_at,
      #genre: AlexandriaWeb.GenreJSON.show(%{genre: book.genre})
      genre: book.genre.name
    }
  end
end
