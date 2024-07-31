defmodule Alexandria.Library.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :title, :string
    field :published_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :published_at])
    |> validate_required([:title, :published_at])
  end
end
