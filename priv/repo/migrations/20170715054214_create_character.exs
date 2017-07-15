defmodule Trpg.Repo.Migrations.CreateCharacter do
  use Ecto.Migration

  def change do
    create table(:characters) do
      add :name, :string
      add :avator, :string
      add :user_id, :bigint
      add :race_id, :int
      add :job_id, :int
      add :description, :text

      timestamps()
    end
  end
end
