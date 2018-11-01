defmodule Scrumpoker.Analytics.View do
  use Ecto.Schema
  import Ecto.Changeset

  schema "views" do
    field(:date, :string)

    timestamps()
  end

  @doc false
  def changeset(view, attrs) do
    view
    |> cast(attrs, [:date])
    |> validate_required([:date])
  end
end
