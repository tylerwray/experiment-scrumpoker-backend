defmodule ScrumpokerWeb.Schema.PageViewTypes do
  use Absinthe.Schema.Notation

  object :page_view do
    field(:id, :id)
    field(:page, :string)
    field(:inserted_at, :string)
  end
end
