defmodule ScrumpokerWeb.EventView do
  use ScrumpokerWeb, :view
  alias ScrumpokerWeb.EventView

  def render("index.json", %{events: events}) do
    %{data: render_many(events, EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{id: event.id, name: event.name, session_id: event.session_id}
  end
end
