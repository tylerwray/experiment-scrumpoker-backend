defmodule ScrumpokerWeb.DeviceTypeController do
  use ScrumpokerWeb, :controller

  alias Scrumpoker.Analytics
  alias Scrumpoker.Analytics.DeviceType

  action_fallback(ScrumpokerWeb.FallbackController)

  def index(conn, _params) do
    device_types = Analytics.list_device_types()
    render(conn, "index.json", device_types: device_types)
  end

  def create(conn, %{"device_type" => device_type_params}) do
    with {:ok, %DeviceType{} = device_type} <- Analytics.create_device_type(device_type_params) do
      conn
      |> put_status(:created)
      |> render("show.json", device_type: device_type)
    end
  end

  def show(conn, %{"id" => id}) do
    device_type = Analytics.get_device_type!(id)
    render(conn, "show.json", device_type: device_type)
  end

  def update(conn, %{"id" => id, "device_type" => device_type_params}) do
    device_type = Analytics.get_device_type!(id)

    with {:ok, %DeviceType{} = device_type} <-
           Analytics.update_device_type(device_type, device_type_params) do
      render(conn, "show.json", device_type: device_type)
    end
  end

  def delete(conn, %{"id" => id}) do
    device_type = Analytics.get_device_type!(id)

    with {:ok, %DeviceType{}} <- Analytics.delete_device_type(device_type) do
      send_resp(conn, :no_content, "")
    end
  end
end
