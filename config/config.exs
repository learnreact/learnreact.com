# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :learn_react,
  ecto_repos: [LearnReact.Repo]

# Configures the endpoint
config :learn_react, LearnReact.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Jg+ei3ggTI0FYA646XOZ3SKK93g6Re0kwHRK8Ijrl8krsYH+o6f+AIQZdZTWxH+s",
  render_errors: [view: LearnReact.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LearnReact.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
