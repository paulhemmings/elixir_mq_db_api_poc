use Mix.Config

config :elixir_mq_db_api_poc, ecto_repos: [Repo]

config :elixir_mq_db_api_poc, Repo,
  adapter: Ecto.Adapters.MySQL,
  database: "test",
  username: "test",
  password: "test",
  hostname: "127.0.0.1"
