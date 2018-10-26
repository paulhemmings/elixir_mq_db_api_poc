defmodule Producer do
  use AMQP

  @exchange    "crypto_coin_exchange"

  def send(payload) do
    {:ok, conn} = AMQP.Connection.open
    {:ok, chan} = AMQP.Channel.open(conn)
    AMQP.Basic.publish chan, @exchange, "", payload
  end

  def loadCoins() do
    {:ok, conn} = AMQP.Connection.open
    {:ok, chan} = AMQP.Channel.open(conn)

    Adapter.Crypto.coins()
    |> Enum.each( fn coin -> addCoin(coin, chan) end)
  end

  def addCoin(coin, chan) do
    payload = Poison.encode!(coin)
    AMQP.Basic.publish chan, @exchange, "", payload
  end
end
