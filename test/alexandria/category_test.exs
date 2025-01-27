defmodule Alexandria.CategoryTest do
  use Alexandria.DataCase

  alias Alexandria.Category

  describe "genres" do
    alias Alexandria.Category.Genre

    import Alexandria.CategoryFixtures

    @invalid_attrs %{name: nil}

    test "list_genres/0 returns all genres" do
      genre = genre_fixture()
      assert Category.list_genres() == [genre]
    end

    test "get_genre!/1 returns the genre with given id" do
      genre = genre_fixture()
      assert Category.get_genre!(genre.id) == genre
    end

    test "create_genre/1 with valid data creates a genre" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Genre{} = genre} = Category.create_genre(valid_attrs)
      assert genre.name == "some name"
    end

    test "create_genre/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Category.create_genre(@invalid_attrs)
    end

    test "update_genre/2 with valid data updates the genre" do
      genre = genre_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Genre{} = genre} = Category.update_genre(genre, update_attrs)
      assert genre.name == "some updated name"
    end

    test "update_genre/2 with invalid data returns error changeset" do
      genre = genre_fixture()
      assert {:error, %Ecto.Changeset{}} = Category.update_genre(genre, @invalid_attrs)
      assert genre == Category.get_genre!(genre.id)
    end

    test "delete_genre/1 deletes the genre" do
      genre = genre_fixture()
      assert {:ok, %Genre{}} = Category.delete_genre(genre)
      assert_raise Ecto.NoResultsError, fn -> Category.get_genre!(genre.id) end
    end

    test "change_genre/1 returns a genre changeset" do
      genre = genre_fixture()
      assert %Ecto.Changeset{} = Category.change_genre(genre)
    end
  end
end
