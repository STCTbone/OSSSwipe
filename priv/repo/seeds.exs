# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     OssSwipe.Repo.insert!(%OssSwipe.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
OssSwipe.Repo.delete_all OssSwipe.User

OssSwipe.User.changeset(%OssSwipe.User{}, %{name: "Test User", email: "testuser@example.com", password: "secret", password_confirmation: "secret"})
|> OssSwipe.Repo.insert!