defmodule Scrumpoker.Analytics do
  @moduledoc """
  The Analytics context.
  """

  import Ecto.Query, warn: false
  alias Scrumpoker.Repo

  alias Scrumpoker.Analytics.PageView

  @doc """
  Returns the list of page_views.

  ## Examples

      iex> list_page_views()
      [%PageView{}, ...]

  """
  def list_page_views do
    Repo.all(PageView)
  end

  @doc """
  Gets a single page_view.

  Raises `Ecto.NoResultsError` if the Page view does not exist.

  ## Examples

      iex> get_page_view!(123)
      %PageView{}

      iex> get_page_view!(456)
      ** (Ecto.NoResultsError)

  """
  def get_page_view!(id), do: Repo.get!(PageView, id)

  @doc """
  Creates a page_view.

  ## Examples

      iex> create_page_view(%{field: value})
      {:ok, %PageView{}}

      iex> create_page_view(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_page_view(attrs \\ %{}) do
    %PageView{}
    |> PageView.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a page_view.

  ## Examples

      iex> update_page_view(page_view, %{field: new_value})
      {:ok, %PageView{}}

      iex> update_page_view(page_view, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_page_view(%PageView{} = page_view, attrs) do
    page_view
    |> PageView.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PageView.

  ## Examples

      iex> delete_page_view(page_view)
      {:ok, %PageView{}}

      iex> delete_page_view(page_view)
      {:error, %Ecto.Changeset{}}

  """
  def delete_page_view(%PageView{} = page_view) do
    Repo.delete(page_view)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking page_view changes.

  ## Examples

      iex> change_page_view(page_view)
      %Ecto.Changeset{source: %PageView{}}

  """
  def change_page_view(%PageView{} = page_view) do
    PageView.changeset(page_view, %{})
  end

  alias Scrumpoker.Analytics.Session

  @doc """
  Returns the list of sessions.

  ## Examples

      iex> list_sessions()
      [%Session{}, ...]

  """
  def list_sessions do
    Repo.all(Session)
  end

  @doc """
  Gets a single session.

  Raises `Ecto.NoResultsError` if the Session does not exist.

  ## Examples

      iex> get_session!(123)
      %Session{}

      iex> get_session!(456)
      ** (Ecto.NoResultsError)

  """
  def get_session!(id), do: Repo.get!(Session, id)

  @doc """
  Creates a session.

  ## Examples

      iex> create_session(%{field: value})
      {:ok, %Session{}}

      iex> create_session(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_session(attrs \\ %{}) do
    %Session{}
    |> Session.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a session.

  ## Examples

      iex> update_session(session, %{field: new_value})
      {:ok, %Session{}}

      iex> update_session(session, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_session(%Session{} = session, attrs) do
    session
    |> Session.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Session.

  ## Examples

      iex> delete_session(session)
      {:ok, %Session{}}

      iex> delete_session(session)
      {:error, %Ecto.Changeset{}}

  """
  def delete_session(%Session{} = session) do
    Repo.delete(session)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking session changes.

  ## Examples

      iex> change_session(session)
      %Ecto.Changeset{source: %Session{}}

  """
  def change_session(%Session{} = session) do
    Session.changeset(session, %{})
  end

  alias Scrumpoker.Analytics.DeviceType

  @doc """
  Returns the list of device_types.

  ## Examples

      iex> list_device_types()
      [%DeviceType{}, ...]

  """
  def list_device_types do
    Repo.all(DeviceType)
  end

  @doc """
  Gets a single device_type.

  Raises `Ecto.NoResultsError` if the Device type does not exist.

  ## Examples

      iex> get_device_type!(123)
      %DeviceType{}

      iex> get_device_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_device_type!(id), do: Repo.get!(DeviceType, id)

  @doc """
  Creates a device_type.

  ## Examples

      iex> create_device_type(%{field: value})
      {:ok, %DeviceType{}}

      iex> create_device_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_device_type(attrs \\ %{}) do
    %DeviceType{}
    |> DeviceType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a device_type.

  ## Examples

      iex> update_device_type(device_type, %{field: new_value})
      {:ok, %DeviceType{}}

      iex> update_device_type(device_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_device_type(%DeviceType{} = device_type, attrs) do
    device_type
    |> DeviceType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a DeviceType.

  ## Examples

      iex> delete_device_type(device_type)
      {:ok, %DeviceType{}}

      iex> delete_device_type(device_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_device_type(%DeviceType{} = device_type) do
    Repo.delete(device_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking device_type changes.

  ## Examples

      iex> change_device_type(device_type)
      %Ecto.Changeset{source: %DeviceType{}}

  """
  def change_device_type(%DeviceType{} = device_type) do
    DeviceType.changeset(device_type, %{})
  end

  alias Scrumpoker.Analytics.Event

  @doc """
  Returns the list of events.

  ## Examples

      iex> list_events()
      [%Event{}, ...]

  """
  def list_events do
    Repo.all(Event)
  end

  @doc """
  Gets a single event.

  Raises `Ecto.NoResultsError` if the Event does not exist.

  ## Examples

      iex> get_event!(123)
      %Event{}

      iex> get_event!(456)
      ** (Ecto.NoResultsError)

  """
  def get_event!(id), do: Repo.get!(Event, id)

  @doc """
  Creates a event.

  ## Examples

      iex> create_event(%{field: value})
      {:ok, %Event{}}

      iex> create_event(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_event(attrs \\ %{}) do
    %Event{}
    |> Event.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a event.

  ## Examples

      iex> update_event(event, %{field: new_value})
      {:ok, %Event{}}

      iex> update_event(event, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_event(%Event{} = event, attrs) do
    event
    |> Event.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Event.

  ## Examples

      iex> delete_event(event)
      {:ok, %Event{}}

      iex> delete_event(event)
      {:error, %Ecto.Changeset{}}

  """
  def delete_event(%Event{} = event) do
    Repo.delete(event)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking event changes.

  ## Examples

      iex> change_event(event)
      %Ecto.Changeset{source: %Event{}}

  """
  def change_event(%Event{} = event) do
    Event.changeset(event, %{})
  end
end
