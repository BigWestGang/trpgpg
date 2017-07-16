defmodule Trpg.Repo.Migrations.CreateCharacter do
  use Ecto.Migration

  def change do
    create table(:characters) do
      add :name, :string
      add :avator_id, :bigint
      add :user_id, :bigint
      add :sex, :string
      add :race_id, :bigint
      add :job_id, :bigint
      add :sub_job_id, :bigint
      add :tags_id, :bigint
      add :description, :text
      add :guidingcreed_id, :bigint
      timestamps()
    end
  end
end
