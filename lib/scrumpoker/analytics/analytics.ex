defmodule Scrumpoker.Analytics do
  @moduledoc """
  The Analytics context.
  """

  import Ecto.Query, warn: false
  alias Scrumpoker.Repo
  alias Scrumpoker.Analytics.PageView

  @doc """
  Returns the list of page views.
  """
  def list_page_views do
    Repo.all(PageView)
  end

  @doc """
  Gets a single page view.

  Raises `Ecto.NoResultsError` if the PageView does not exist.
  """
  def get_page_view!(id), do: Repo.get!(PageView, id)

  @doc """
  Creates a page view.
  """
  def create_page_view(attrs \\ %{}) do
    %PageView{}
    |> PageView.changeset(attrs)
    |> Repo.insert()
  end
end
