defmodule Emoodji.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :message, :string
      add :userId, :integer

      timestamps()
    end

  end
end
