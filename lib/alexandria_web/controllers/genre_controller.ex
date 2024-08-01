defmodule AlexandriaWeb.GenreController do
  use AlexandriaWeb, :controller

  alias Alexandria.Category
  alias Alexandria.Category.Genre

  action_fallback AlexandriaWeb.FallbackController

  def index(conn, _params) do
    genres = Category.list_genres()
    render(conn, :index, genres: genres)
  end

  def create(conn, %{"genre" => genre_params}) do
    with {:ok, %Genre{} = genre} <- Category.create_genre(genre_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/genres/#{genre}")
      |> render(:show, genre: genre)
    end
  end

  def show(conn, %{"id" => id}) do
    genre = Category.get_genre!(id)
    render(conn, :show, genre: genre)
  end

  def update(conn, %{"id" => id, "genre" => genre_params}) do
    genre = Category.get_genre!(id)

    with {:ok, %Genre{} = genre} <- Category.update_genre(genre, genre_params) do
      render(conn, :show, genre: genre)
    end
  end

  def delete(conn, %{"id" => id}) do
    genre = Category.get_genre!(id)

    with {:ok, %Genre{}} <- Category.delete_genre(genre) do
      send_resp(conn, :no_content, "")
    end
  end
end
