defmodule Scrumpoker.Analytics.Session do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sessions" do
    field(:browser, :string)
    field(:device_type_id, :integer)
    field(:ip_address, :string)

    timestamps()
  end

  @doc false
  def changeset(session, attrs) do
    session
    |> cast(attrs, [:ip_address, :browser, :device_type_id])
    |> validate_required([:ip_address, :browser, :device_type_id])
  end
end
