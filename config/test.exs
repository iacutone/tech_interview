use Mix.Config

# Configure your database
config :tech_interview, TechInterview.Repo,
  username: "postgres",
  password: "postgres",
  database: "tech_interview_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tech_interview, TechInterviewWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
