defmodule ScrumpokerWeb.DeviceTypeView do
  use ScrumpokerWeb, :view
  alias ScrumpokerWeb.DeviceTypeView

  def render("index.json", %{device_types: device_types}) do
    %{data: render_many(device_types, DeviceTypeView, "device_type.json")}
  end

  def render("show.json", %{device_type: device_type}) do
    %{data: render_one(device_type, DeviceTypeView, "device_type.json")}
  end

  def render("device_type.json", %{device_type: device_type}) do
    %{id: device_type.id, type: device_type.type}
  end
end
