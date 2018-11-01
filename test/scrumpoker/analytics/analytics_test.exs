defmodule Scrumpoker.AnalyticsTest do
  use Scrumpoker.DataCase

  alias Scrumpoker.Analytics

  describe "page_views" do
    alias Scrumpoker.Analytics.PageView

    @valid_attrs %{page: "some page", session_id: 42}
    @update_attrs %{page: "some updated page", session_id: 43}
    @invalid_attrs %{page: nil, session_id: nil}

    def page_view_fixture(attrs \\ %{}) do
      {:ok, page_view} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Analytics.create_page_view()

      page_view
    end

    test "list_page_views/0 returns all page_views" do
      page_view = page_view_fixture()
      assert Analytics.list_page_views() == [page_view]
    end

    test "get_page_view!/1 returns the page_view with given id" do
      page_view = page_view_fixture()
      assert Analytics.get_page_view!(page_view.id) == page_view
    end

    test "create_page_view/1 with valid data creates a page_view" do
      assert {:ok, %PageView{} = page_view} = Analytics.create_page_view(@valid_attrs)
      assert page_view.page == "some page"
      assert page_view.session_id == 42
    end

    test "create_page_view/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Analytics.create_page_view(@invalid_attrs)
    end

    test "update_page_view/2 with valid data updates the page_view" do
      page_view = page_view_fixture()
      assert {:ok, page_view} = Analytics.update_page_view(page_view, @update_attrs)
      assert %PageView{} = page_view
      assert page_view.page == "some updated page"
      assert page_view.session_id == 43
    end

    test "update_page_view/2 with invalid data returns error changeset" do
      page_view = page_view_fixture()
      assert {:error, %Ecto.Changeset{}} = Analytics.update_page_view(page_view, @invalid_attrs)
      assert page_view == Analytics.get_page_view!(page_view.id)
    end

    test "delete_page_view/1 deletes the page_view" do
      page_view = page_view_fixture()
      assert {:ok, %PageView{}} = Analytics.delete_page_view(page_view)
      assert_raise Ecto.NoResultsError, fn -> Analytics.get_page_view!(page_view.id) end
    end

    test "change_page_view/1 returns a page_view changeset" do
      page_view = page_view_fixture()
      assert %Ecto.Changeset{} = Analytics.change_page_view(page_view)
    end
  end

  describe "sessions" do
    alias Scrumpoker.Analytics.Session

    @valid_attrs %{browser: "some browser", device_type_id: 42, ip_address: "some ip_address"}
    @update_attrs %{
      browser: "some updated browser",
      device_type_id: 43,
      ip_address: "some updated ip_address"
    }
    @invalid_attrs %{browser: nil, device_type_id: nil, ip_address: nil}

    def session_fixture(attrs \\ %{}) do
      {:ok, session} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Analytics.create_session()

      session
    end

    test "list_sessions/0 returns all sessions" do
      session = session_fixture()
      assert Analytics.list_sessions() == [session]
    end

    test "get_session!/1 returns the session with given id" do
      session = session_fixture()
      assert Analytics.get_session!(session.id) == session
    end

    test "create_session/1 with valid data creates a session" do
      assert {:ok, %Session{} = session} = Analytics.create_session(@valid_attrs)
      assert session.browser == "some browser"
      assert session.device_type_id == 42
      assert session.ip_address == "some ip_address"
    end

    test "create_session/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Analytics.create_session(@invalid_attrs)
    end

    test "update_session/2 with valid data updates the session" do
      session = session_fixture()
      assert {:ok, session} = Analytics.update_session(session, @update_attrs)
      assert %Session{} = session
      assert session.browser == "some updated browser"
      assert session.device_type_id == 43
      assert session.ip_address == "some updated ip_address"
    end

    test "update_session/2 with invalid data returns error changeset" do
      session = session_fixture()
      assert {:error, %Ecto.Changeset{}} = Analytics.update_session(session, @invalid_attrs)
      assert session == Analytics.get_session!(session.id)
    end

    test "delete_session/1 deletes the session" do
      session = session_fixture()
      assert {:ok, %Session{}} = Analytics.delete_session(session)
      assert_raise Ecto.NoResultsError, fn -> Analytics.get_session!(session.id) end
    end

    test "change_session/1 returns a session changeset" do
      session = session_fixture()
      assert %Ecto.Changeset{} = Analytics.change_session(session)
    end
  end

  describe "device_types" do
    alias Scrumpoker.Analytics.DeviceType

    @valid_attrs %{type: "some type"}
    @update_attrs %{type: "some updated type"}
    @invalid_attrs %{type: nil}

    def device_type_fixture(attrs \\ %{}) do
      {:ok, device_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Analytics.create_device_type()

      device_type
    end

    test "list_device_types/0 returns all device_types" do
      device_type = device_type_fixture()
      assert Analytics.list_device_types() == [device_type]
    end

    test "get_device_type!/1 returns the device_type with given id" do
      device_type = device_type_fixture()
      assert Analytics.get_device_type!(device_type.id) == device_type
    end

    test "create_device_type/1 with valid data creates a device_type" do
      assert {:ok, %DeviceType{} = device_type} = Analytics.create_device_type(@valid_attrs)
      assert device_type.type == "some type"
    end

    test "create_device_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Analytics.create_device_type(@invalid_attrs)
    end

    test "update_device_type/2 with valid data updates the device_type" do
      device_type = device_type_fixture()
      assert {:ok, device_type} = Analytics.update_device_type(device_type, @update_attrs)
      assert %DeviceType{} = device_type
      assert device_type.type == "some updated type"
    end

    test "update_device_type/2 with invalid data returns error changeset" do
      device_type = device_type_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Analytics.update_device_type(device_type, @invalid_attrs)

      assert device_type == Analytics.get_device_type!(device_type.id)
    end

    test "delete_device_type/1 deletes the device_type" do
      device_type = device_type_fixture()
      assert {:ok, %DeviceType{}} = Analytics.delete_device_type(device_type)
      assert_raise Ecto.NoResultsError, fn -> Analytics.get_device_type!(device_type.id) end
    end

    test "change_device_type/1 returns a device_type changeset" do
      device_type = device_type_fixture()
      assert %Ecto.Changeset{} = Analytics.change_device_type(device_type)
    end
  end

  describe "events" do
    alias Scrumpoker.Analytics.Event

    @valid_attrs %{name: "some name", session_id: 42}
    @update_attrs %{name: "some updated name", session_id: 43}
    @invalid_attrs %{name: nil, session_id: nil}

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Analytics.create_event()

      event
    end

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Analytics.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Analytics.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      assert {:ok, %Event{} = event} = Analytics.create_event(@valid_attrs)
      assert event.name == "some name"
      assert event.session_id == 42
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Analytics.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      assert {:ok, event} = Analytics.update_event(event, @update_attrs)
      assert %Event{} = event
      assert event.name == "some updated name"
      assert event.session_id == 43
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Analytics.update_event(event, @invalid_attrs)
      assert event == Analytics.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Analytics.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Analytics.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Analytics.change_event(event)
    end
  end
end
