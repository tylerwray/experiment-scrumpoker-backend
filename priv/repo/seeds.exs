# Add some page views
Enum.each(1..10, fn x -> Scrumpoker.Repo.insert!(%Scrumpoker.Analytics.PageView{page: "/hello/#{x}"}) end)
