# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tech_interview,
  ecto_repos: [TechInterview.Repo]

# Configures the endpoint
config :tech_interview, TechInterviewWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "aYSegLTzjBdQZ6DvhS6s9HI3SrPPHGPr+VT6CGlcrdyuPFanVfAXqKf32sKrW4J2",
  render_errors: [view: TechInterviewWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TechInterview.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "af7hE4CCzGIpqvzm/0tUxu9Q5AdSf4mP"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
