defmodule AlexandriaWeb.GenreJSON do
  alias Alexandria.Category.Genre

  @doc """
  Renders a list of genres.
  """
  def index(%{genres: genres}) do
    %{data: for(genre <- genres, do: data(genre))}
  end

  @doc """
  Renders a single genre.
  """
  def show(%{genre: genre}) do
    %{data: data(genre)}
  end

  defp data(%Genre{} = genre) do
    %{
      id: genre.id,
      name: genre.name
    }
  end
end
