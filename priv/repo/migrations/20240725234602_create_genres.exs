defmodule Alexandria.Repo.Migrations.CreateGenres do
  use Ecto.Migration

  def change do
    create table(:genres) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
