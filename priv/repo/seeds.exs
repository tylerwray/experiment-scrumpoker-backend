# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Scrumpoker.Repo.insert!(%Scrumpoker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Add the device types
Scrumpoker.Repo.insert!(%Scrumpoker.Analytics.DeviceType{type: "Tablet"})
Scrumpoker.Repo.insert!(%Scrumpoker.Analytics.DeviceType{type: "Desktop"})
Scrumpoker.Repo.insert!(%Scrumpoker.Analytics.DeviceType{type: "Phone"})
Scrumpoker.Repo.insert!(%Scrumpoker.Analytics.DeviceType{type: "Gaming Console"})

# Add five sessions
Scrumpoker.Repo.insert!(%Scrumpoker.Analytics.Session{browser: "Chrome 74", device_type_id: 2, ip_address: "183.492.32.1"})
Scrumpoker.Repo.insert!(%Scrumpoker.Analytics.Session{browser: "Safari 12.1-beta", device_type_id: 3, ip_address: "234.852.32.132"})
Scrumpoker.Repo.insert!(%Scrumpoker.Analytics.Session{browser: "Samsung Metro", device_type_id: 3, ip_address: "842.134.99.905"})
Scrumpoker.Repo.insert!(%Scrumpoker.Analytics.Session{browser: "Firefox Quantum", device_type_id: 1, ip_address: "184.155.24.674"})
Scrumpoker.Repo.insert!(%Scrumpoker.Analytics.Session{browser: "PSV Mega", device_type_id: 4, ip_address: "842.134.99.905"})

# Add some page views (link to the five sessions)
Enum.each(1..1000, fn x -> Scrumpoker.Repo.insert!(%Scrumpoker.Analytics.PageView{page: "/ready/#{x}", session_id: rem((x * 3), 5) + 1}) end)

# Add some events (link to the five sessions)
Enum.each(1..1000, fn x -> Scrumpoker.Repo.insert!(%Scrumpoker.Analytics.Event{name: "Clicked button number #{x}", session_id: rem((x * 3), 5) + 1}) end)
