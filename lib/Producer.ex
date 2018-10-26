defmodule Producer do
  use AMQP

  def send(payload) do
    {:ok, conn} = AMQP.Connection.open
    {:ok, chan} = AMQP.Channel.open(conn)
    AMQP.Basic.publish chan, "gen_server_test_exchange", "", payload
  end

end
