defmodule ScrumpokerWeb.PageViewView do
  use ScrumpokerWeb, :view
  alias ScrumpokerWeb.PageViewView

  def render("index.json", %{page_views: page_views}) do
    %{data: render_many(page_views, PageViewView, "page_view.json")}
  end

  def render("show.json", %{page_view: page_view}) do
    %{data: render_one(page_view, PageViewView, "page_view.json")}
  end

  def render("page_view.json", %{page_view: page_view}) do
    %{id: page_view.id, page: page_view.page, session_id: page_view.session_id}
  end
end
