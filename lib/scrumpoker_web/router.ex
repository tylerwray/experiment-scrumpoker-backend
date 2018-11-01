defmodule ScrumpokerWeb.Router do
  use ScrumpokerWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", ScrumpokerWeb do
    pipe_through(:api)

    scope "/analytics" do
      resources("/page_views", PageViewController, except: [:new, :edit])
      resources("/sessions", SessionController, except: [:new, :edit])
      resources("/device_types", DeviceTypeController, except: [:new, :edit])
      resources("/events", EventController, except: [:new, :edit])
    end
  end
end
