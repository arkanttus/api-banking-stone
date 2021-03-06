# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :api_banking,
  ecto_repos: [ApiBanking.Repo]

config :api_banking_web,
  ecto_repos: [ApiBanking.Repo],
  generators: [context_app: :api_banking, binary_id: true]

# Configures the endpoint
config :api_banking_web, ApiBankingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "t4GdJir541dJyE9/SJi/traRSzSXbhMT3H8qWvuRkDorwR0rQzEGg4tCYnqeDd8L",
  render_errors: [view: ApiBankingWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ApiBanking.PubSub,
  live_view: [signing_salt: "1oT6Yef9"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
