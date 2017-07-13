defmodule Trpg.UserTest do
  use Trpg.ModelCase

  alias Trpg.User

  @valid_attrs %{avator: "some content", name: "some content", twitter_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
