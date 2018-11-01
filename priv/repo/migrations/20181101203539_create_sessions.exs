defmodule Scrumpoker.Repo.Migrations.CreateSessions do
  use Ecto.Migration

  def change do
    create table(:sessions) do
      add :ip_address, :string
      add :browser, :string
      add :device_type_id, :integer

      timestamps()
    end

  end
end
