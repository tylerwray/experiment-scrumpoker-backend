defmodule Scrumpoker.Repo.Migrations.CreatePageViews do
  use Ecto.Migration

  def change do
    create table(:page_views) do
      add :page, :string

      timestamps()
    end
  end
end
