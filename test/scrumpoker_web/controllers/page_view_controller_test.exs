defmodule ScrumpokerWeb.PageViewControllerTest do
  use ScrumpokerWeb.ConnCase

  alias Scrumpoker.Analytics
  alias Scrumpoker.Analytics.PageView

  @create_attrs %{page: "some page", session_id: 42}
  @update_attrs %{page: "some updated page", session_id: 43}
  @invalid_attrs %{page: nil, session_id: nil}

  def fixture(:page_view) do
    {:ok, page_view} = Analytics.create_page_view(@create_attrs)
    page_view
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all page_views", %{conn: conn} do
      conn = get(conn, page_view_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create page_view" do
    test "renders page_view when data is valid", %{conn: conn} do
      conn = post(conn, page_view_path(conn, :create), page_view: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, page_view_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "page" => "some page",
               "session_id" => 42
             }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, page_view_path(conn, :create), page_view: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update page_view" do
    setup [:create_page_view]

    test "renders page_view when data is valid", %{
      conn: conn,
      page_view: %PageView{id: id} = page_view
    } do
      conn = put(conn, page_view_path(conn, :update, page_view), page_view: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, page_view_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "page" => "some updated page",
               "session_id" => 43
             }
    end

    test "renders errors when data is invalid", %{conn: conn, page_view: page_view} do
      conn = put(conn, page_view_path(conn, :update, page_view), page_view: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete page_view" do
    setup [:create_page_view]

    test "deletes chosen page_view", %{conn: conn, page_view: page_view} do
      conn = delete(conn, page_view_path(conn, :delete, page_view))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, page_view_path(conn, :show, page_view))
      end)
    end
  end

  defp create_page_view(_) do
    page_view = fixture(:page_view)
    {:ok, page_view: page_view}
  end
end
