defmodule Emoodji.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    rename table(:posts), :userId, to: :user_id
  end
end
