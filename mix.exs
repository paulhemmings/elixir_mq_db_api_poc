defmodule ElixirMqDbApiPoc.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_mq_db_api_poc,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:amqp, :logger, :ecto, :mariaex],
      mod: {ElixirMqDbApiPoc.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # https://github.com/pma/amqp
      {:amqp, "~> 1.0"},
      # https://github.com/pma/amqp/issues/99 <= issue with ranch dependency
      {:ranch_proxy_protocol, "~> 2.0", override: true},
      # http://geoffreylessel.com/2016/using-ecto-with-an-existing-mysql-database/
      {:ecto, "~> 2.0"},
      {:mariaex, "~> 0.7"}
    ]
  end
end
