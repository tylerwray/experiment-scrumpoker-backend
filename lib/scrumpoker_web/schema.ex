defmodule ScrumpokerWeb.Schema do
  use Absinthe.Schema
  import_types(ScrumpokerWeb.Schema.PageViewTypes)

  alias ScrumpokerWeb.Resolvers

  query do
    @desc "Get all posts"
    field :page_views, list_of(:page_view) do
      resolve(&Resolvers.PageView.list_page_views/3)
    end
  end
end
