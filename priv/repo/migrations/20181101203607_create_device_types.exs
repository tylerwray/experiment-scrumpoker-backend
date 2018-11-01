defmodule Scrumpoker.Repo.Migrations.CreateDeviceTypes do
  use Ecto.Migration

  def change do
    create table(:device_types) do
      add :type, :string

      timestamps()
    end

  end
end
