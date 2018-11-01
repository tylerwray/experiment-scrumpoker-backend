defmodule Scrumpoker.Analytics.PageView do
  use Ecto.Schema
  import Ecto.Changeset

  schema "page_views" do
    field(:page, :string)
    field(:session_id, :integer)

    timestamps()
  end

  @doc false
  def changeset(page_view, attrs) do
    page_view
    |> cast(attrs, [:page, :session_id])
    |> validate_required([:page, :session_id])
  end
end
