# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Alexandria.Repo.insert!(%Alexandria.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Alexandria.Category.Genre
alias Alexandria.Library.Book
alias Alexandria.Repo

programming = Repo.insert!(%Genre{ name: "Programming" })
self_help = Repo.insert!(%Genre{ name: "Self-Help" })
sci_fi = Repo.insert!(%Genre{ name: "Sci-Fi" })

Repo.insert!(%Book{
  title: "Ender´s Game",
  published_at: ~U[2024-08-01 23:07:33Z],
  genre_id: sci_fi.id
})
Repo.insert!(%Book{
  title: "Atomic Habits",
  published_at: ~U[2024-08-02 23:07:33Z],
  genre_id: self_help.id
})
Repo.insert!(%Book{
  title: "Design Patterns",
  published_at: ~U[2024-08-03 23:07:33Z],
  genre_id: programming.id
})
Repo.insert!(%Book{
  title: "Domain Driven Design",
  published_at: ~U[2024-08-04 23:07:33Z],
  genre_id: programming.id
})
Repo.insert!(%Book{
  title: "The Pragmatic Programmer",
  published_at: ~U[2024-09-01 23:07:33Z],
  genre_id: programming.id
})
