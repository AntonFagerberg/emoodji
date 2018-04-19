# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :emoodji,
  ecto_repos: [Emoodji.Repo]

# Configures the endpoint
config :emoodji, EmoodjiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "J49OIf633wonN5cuoFnibiGfXj6A4L+5oxDzfTMe652vEW8hJfumqcN/XUKoyzWv",
  render_errors: [view: EmoodjiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Emoodji.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
