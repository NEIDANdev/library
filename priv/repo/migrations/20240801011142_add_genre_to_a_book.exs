defmodule Alexandria.Repo.Migrations.AddGenreToABook do
  use Ecto.Migration

  def change do
    alter table(:books) do
      add :book_genre, references(:genres, on_delete: :nothing)
    end
  end
end
