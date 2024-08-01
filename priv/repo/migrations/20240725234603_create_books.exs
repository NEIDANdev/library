defmodule Alexandria.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :published_at, :utc_datetime
      add :genre_id, references(:genres, on_delete: :nilify_all), null: true

      timestamps(type: :utc_datetime)
    end
  end
end
