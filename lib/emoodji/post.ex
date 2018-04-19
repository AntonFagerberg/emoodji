defmodule Emoodji.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :message, :string
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:message, :user_id])
    |> validate_required([:message, :user_id])
    |> validate_length(:message, min: 1)
    |> validate_length(:message, max: 1)
  end
end
