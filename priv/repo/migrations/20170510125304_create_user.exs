defmodule Trpg.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :twitter_id, :integer
      add :avator, :string

      timestamps()
    end

  end
end
