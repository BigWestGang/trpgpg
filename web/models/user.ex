defmodule Trpg.User do
  use Trpg.Web, :model

  schema "users" do
    field :name, :string
    field :twitter_id, :integer
    field :avator, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :twitter_id, :avator])
    |> unique_constraint(:twitter_id)
    |> validate_required([:name, :twitter_id, :avator])
  end
end
