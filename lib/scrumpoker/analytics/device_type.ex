defmodule Scrumpoker.Analytics.DeviceType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "device_types" do
    field(:type, :string)

    timestamps()
  end

  @doc false
  def changeset(device_type, attrs) do
    device_type
    |> cast(attrs, [:type])
    |> validate_required([:type])
  end
end
