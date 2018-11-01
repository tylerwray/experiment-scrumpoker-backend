defmodule ScrumpokerWeb.SessionView do
  use ScrumpokerWeb, :view
  alias ScrumpokerWeb.SessionView

  def render("index.json", %{sessions: sessions}) do
    %{data: render_many(sessions, SessionView, "session.json")}
  end

  def render("show.json", %{session: session}) do
    %{data: render_one(session, SessionView, "session.json")}
  end

  def render("session.json", %{session: session}) do
    %{
      id: session.id,
      ip_address: session.ip_address,
      browser: session.browser,
      device_type_id: session.device_type_id
    }
  end
end
