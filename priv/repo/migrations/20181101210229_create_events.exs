defmodule Scrumpoker.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :session_id, :integer

      timestamps()
    end

  end
end
