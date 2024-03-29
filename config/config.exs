# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :scrumpoker,
  ecto_repos: [Scrumpoker.Repo]

# Configures the endpoint
config :scrumpoker, ScrumpokerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/fXwXgei26EHe2M1AN/RogOxTcbdpBG4CVMcgTGCV+RpPu2qKH/gAnNrXz8MggVI",
  render_errors: [view: ScrumpokerWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Scrumpoker.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
