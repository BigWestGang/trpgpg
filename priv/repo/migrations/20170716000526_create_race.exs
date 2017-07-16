defmodule Trpg.Repo.Migrations.CreateRace do
  use Ecto.Migration

  def change do
    create table(:races) do
      add :name, :string #種族名
      add :str, :integer #STR基本値
      add :dex, :integer #DEX基本値
      add :pow, :integer #POW基本値
      add :hp, :integer #初期HP
      add :fp, :integer #初期因果力
      add :bp, :integer #ボーナスポイント
      timestamps()
    end

  end
end
