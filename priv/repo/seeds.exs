# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Emoodji.Repo.insert!(%Emoodji.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Emoodji.Repo.insert!(%Emoodji.User{name: "Anton", id: 1})
Emoodji.Repo.insert!(%Emoodji.User{name: "Anna", id: 2})
Emoodji.Repo.insert!(%Emoodji.Post{message: "🤨", user_id: 1})
Emoodji.Repo.insert!(%Emoodji.Post{message: "🙂", user_id: 2})
Emoodji.Repo.insert!(%Emoodji.Post{message: "😭", user_id: 1})
Emoodji.Repo.insert!(%Emoodji.Post{message: "🌸", user_id: 1})
Emoodji.Repo.insert!(%Emoodji.Post{message: "😂", user_id: 2})
Emoodji.Repo.insert!(%Emoodji.Post{message: "🎁", user_id: 2})
