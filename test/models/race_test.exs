defmodule Trpg.RaceTest do
  use Trpg.ModelCase

  alias Trpg.Race

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Race.changeset(%Race{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Race.changeset(%Race{}, @invalid_attrs)
    refute changeset.valid?
  end
end
