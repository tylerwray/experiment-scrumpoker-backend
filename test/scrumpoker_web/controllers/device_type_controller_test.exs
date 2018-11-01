defmodule ScrumpokerWeb.DeviceTypeControllerTest do
  use ScrumpokerWeb.ConnCase

  alias Scrumpoker.Analytics
  alias Scrumpoker.Analytics.DeviceType

  @create_attrs %{type: "some type"}
  @update_attrs %{type: "some updated type"}
  @invalid_attrs %{type: nil}

  def fixture(:device_type) do
    {:ok, device_type} = Analytics.create_device_type(@create_attrs)
    device_type
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all device_types", %{conn: conn} do
      conn = get(conn, device_type_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create device_type" do
    test "renders device_type when data is valid", %{conn: conn} do
      conn = post(conn, device_type_path(conn, :create), device_type: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, device_type_path(conn, :show, id))
      assert json_response(conn, 200)["data"] == %{"id" => id, "type" => "some type"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, device_type_path(conn, :create), device_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update device_type" do
    setup [:create_device_type]

    test "renders device_type when data is valid", %{
      conn: conn,
      device_type: %DeviceType{id: id} = device_type
    } do
      conn = put(conn, device_type_path(conn, :update, device_type), device_type: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, device_type_path(conn, :show, id))
      assert json_response(conn, 200)["data"] == %{"id" => id, "type" => "some updated type"}
    end

    test "renders errors when data is invalid", %{conn: conn, device_type: device_type} do
      conn = put(conn, device_type_path(conn, :update, device_type), device_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete device_type" do
    setup [:create_device_type]

    test "deletes chosen device_type", %{conn: conn, device_type: device_type} do
      conn = delete(conn, device_type_path(conn, :delete, device_type))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, device_type_path(conn, :show, device_type))
      end)
    end
  end

  defp create_device_type(_) do
    device_type = fixture(:device_type)
    {:ok, device_type: device_type}
  end
end
