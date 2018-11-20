defmodule Scrumpoker.AnalyticsTest do
  use Scrumpoker.DataCase

  alias Scrumpoker.Analytics

  describe "page_views" do
    alias Scrumpoker.Analytics.PageView

    @valid_attrs %{page: "/hello"}
    @invalid_attrs %{page: nil}

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
      assert page_view.page == "/hello"
    end

    test "create_page_view/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Analytics.create_page_view(@invalid_attrs)
    end
  end
end
