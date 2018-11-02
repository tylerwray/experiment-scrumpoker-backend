defmodule ScrumpokerWeb.Schema.PageViewTypes do
  use Absinthe.Schema.Notation

  object :page_view do
    field(:id, :id)
    field(:page, :string)
  end
end
