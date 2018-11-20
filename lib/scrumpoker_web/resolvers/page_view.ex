defmodule ScrumpokerWeb.Resolvers.PageView do
  def list_page_views(_parent, _arguments, _resolution) do
    {:ok, Scrumpoker.Analytics.list_page_views()}
  end

  def create_page_view(_parent, args, _resolution) do
    Scrumpoker.Analytics.create_page_view(args)
  end
end
