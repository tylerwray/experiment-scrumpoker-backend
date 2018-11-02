defmodule ScrumpokerWeb.Resolvers.PageView do
  def list_page_views(_parent, _args, _resolution) do
    {:ok, Scrumpoker.Analytics.list_page_views()}
  end
end
