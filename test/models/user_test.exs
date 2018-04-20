defmodule Emoodji.UserTest do
  use ExUnit.Case

  alias Emoodji.User

  @valid_attrs %{"name" => "Anton"}
  @invalid_attrs %{"user_id" => 1}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
