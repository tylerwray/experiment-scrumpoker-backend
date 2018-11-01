defmodule ScrumpokerWeb.SessionController do
  use ScrumpokerWeb, :controller

  alias Scrumpoker.Analytics
  alias Scrumpoker.Analytics.Session

  action_fallback(ScrumpokerWeb.FallbackController)

  def index(conn, _params) do
    sessions = Analytics.list_sessions()
    render(conn, "index.json", sessions: sessions)
  end

  def create(conn, %{"session" => session_params}) do
    with {:ok, %Session{} = session} <- Analytics.create_session(session_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", session_path(conn, :show, session))
      |> render("show.json", session: session)
    end
  end

  def show(conn, %{"id" => id}) do
    session = Analytics.get_session!(id)
    render(conn, "show.json", session: session)
  end

  def update(conn, %{"id" => id, "session" => session_params}) do
    session = Analytics.get_session!(id)

    with {:ok, %Session{} = session} <- Analytics.update_session(session, session_params) do
      render(conn, "show.json", session: session)
    end
  end

  def delete(conn, %{"id" => id}) do
    session = Analytics.get_session!(id)

    with {:ok, %Session{}} <- Analytics.delete_session(session) do
      send_resp(conn, :no_content, "")
    end
  end
end
