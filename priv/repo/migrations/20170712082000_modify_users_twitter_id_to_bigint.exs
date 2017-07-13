defmodule Trpg.Repo.Migrations.ModifyUsersTwitterIdToBigint do
  use Ecto.Migration

  def change do
    alter table(:users) do
      modify :twitter_id, :bigint

    end
  end
end
