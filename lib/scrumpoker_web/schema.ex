defmodule ScrumpokerWeb.Schema do
  use Absinthe.Schema
  import_types(ScrumpokerWeb.Schema.PageViewTypes)

  alias ScrumpokerWeb.Resolvers

  query do
    @desc "Get all page views"
    field :page_views, list_of(:page_view) do
      resolve(&Resolvers.PageView.list_page_views/3)
    end
  end

  mutation do
    @desc "Create a page view"
    field :create_page_view, type: :page_view do
      arg(:page, non_null(:string))

      resolve(&Resolvers.PageView.create_page_view/3)
    end
  end
end
