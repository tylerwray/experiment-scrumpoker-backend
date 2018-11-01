defmodule Scrumpoker.Repo.Migrations.CreatePageViews do
  use Ecto.Migration

  def change do
    create table(:page_views) do
      add :page, :string
      add :session_id, :integer

      timestamps()
    end

  end
end
