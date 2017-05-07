# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :ExkillWeb, ExkillWeb.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hcl0wf5YtS6yp0uqE8MVq0TtWQ0EdlsC9Q3SzTEDZZ8V7fxqeZNqjaIXNCh7VAqu",
  render_errors: [view: ExkillWeb.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ExkillWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ExkillWeb, :mongo_repos, [ExkillWeb.Mongo]

config :ExkillWeb, ExkillWeb.Mongo,
  hostname: "localhost",
  port: 27017,
  database: "zkillboard",
  username: "username",
  password: "password",
  pool_size: 20,
  max_overflow: 5

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
