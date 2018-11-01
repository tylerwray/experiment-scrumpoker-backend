defmodule Scrumpoker.Analytics.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field(:name, :string)
    field(:session_id, :integer)

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :session_id])
    |> validate_required([:name, :session_id])
  end
end
