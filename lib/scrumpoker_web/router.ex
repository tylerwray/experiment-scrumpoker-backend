defmodule ScrumpokerWeb.Router do
  use ScrumpokerWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/" do
    pipe_through(:api)

    forward("/graphiql", Absinthe.Plug.GraphiQL, schema: ScrumpokerWeb.Schema)

    forward("/", Absinthe.Plug, schema: ScrumpokerWeb.Schema)
  end
end
