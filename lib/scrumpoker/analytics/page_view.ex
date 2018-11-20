defmodule Scrumpoker.Analytics.PageView do
  use Ecto.Schema
  import Ecto.Changeset

  schema "page_views" do
    field(:page, :string)

    timestamps()
  end

  @doc false
  def changeset(page_view, attrs) do
    page_view
    |> cast(attrs, [:page])
    |> validate_required([:page])
  end
end
