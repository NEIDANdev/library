defmodule Alexandria.Category.Genre do
  use Ecto.Schema
  import Ecto.Changeset

  schema "genres" do
    field :name, :string
    has_many :books, Alexandria.Library.Book

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(genre, attrs) do
    genre
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
