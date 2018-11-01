defmodule ScrumpokerWeb.PageViewController do
  use ScrumpokerWeb, :controller

  alias Scrumpoker.Analytics
  alias Scrumpoker.Analytics.PageView

  action_fallback(ScrumpokerWeb.FallbackController)

  def index(conn, _params) do
    page_views = Analytics.list_page_views()
    render(conn, "index.json", page_views: page_views)
  end

  def create(conn, %{"page_view" => page_view_params}) do
    with {:ok, %PageView{} = page_view} <- Analytics.create_page_view(page_view_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", page_view_path(conn, :show, page_view))
      |> render("show.json", page_view: page_view)
    end
  end

  def show(conn, %{"id" => id}) do
    page_view = Analytics.get_page_view!(id)
    render(conn, "show.json", page_view: page_view)
  end

  def update(conn, %{"id" => id, "page_view" => page_view_params}) do
    page_view = Analytics.get_page_view!(id)

    with {:ok, %PageView{} = page_view} <- Analytics.update_page_view(page_view, page_view_params) do
      render(conn, "show.json", page_view: page_view)
    end
  end

  def delete(conn, %{"id" => id}) do
    page_view = Analytics.get_page_view!(id)

    with {:ok, %PageView{}} <- Analytics.delete_page_view(page_view) do
      send_resp(conn, :no_content, "")
    end
  end
end
