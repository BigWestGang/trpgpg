use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :trpg, Trpg.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :trpg, Trpg.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "root",
  password: "",
  database: "trpg_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
