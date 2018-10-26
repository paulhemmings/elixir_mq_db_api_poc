# ElixirMqDbApiPoc

## Installation

### Rabbit MQ

````
$ brew update
$ brew install rabbitmq
$ brew services start rabbitmq
````

### mysql

````
$ brew install mysql
$ mysql.server start
````

### Cloning and building

````
$ git clone https://github.com/paulhemmings/elixir_mq_db_api_poc
$ cd elixir_mq_db_api_poc/
$ mix deps.get
````

### Running in script mode

````
$ iex -S mix
````

## Articles based on

### using AMQP
https://github.com/pma/amqp

### GenServer - what they are and how they work
https://hexdocs.pm/elixir/GenServer.html

### Using Ecto
http://geoffreylessel.com/2016/from-zero-to-ecto-in-10-minutes/

### using a MySQL database
http://geoffreylessel.com/2016/using-ecto-with-an-existing-mysql-database/

## Writing to the message queue

````
iex> {:ok, conn} = AMQP.Connection.open
{:ok, %AMQP.Connection{pid: #PID<0.165.0>}}
iex> {:ok, chan} = AMQP.Channel.open(conn)
{:ok, %AMQP.Channel{conn: %AMQP.Connection{pid: #PID<0.165.0>}, pid: #PID<0.177.0>}
iex> AMQP.Queue.declare chan, "test_queue"
{:ok, %{consumer_count: 0, message_count: 0, queue: "test_queue"}}
iex> AMQP.Exchange.declare chan, "test_exchange"
:ok
iex> AMQP.Queue.bind chan, "test_queue", "test_exchange"
:ok
iex> AMQP.Basic.publish chan, "test_exchange", "", "Hello, World!"
:ok
iex> {:ok, payload, meta} = AMQP.Basic.get chan, "test_queue"
iex> payload
"Hello, World!"
iex> AMQP.Queue.subscribe chan, "test_queue", fn(payload, _meta) -> IO.puts("Received: #{payload}") end
{:ok, "amq.ctag-5L8U-n0HU5doEsNTQpaXWg"}
iex> AMQP.Basic.publish chan, "test_exchange", "", "Hello, World!"
:ok
Received: Hello, World!
````

## Starting the Consumer
````
iex> Consumer.start_link
{:ok, #PID<0.261.0>}
````
## Reading from the MySQL database

````
iex(1)> import Ecto.Query
nil
iex(2)> Repo.one from test in Repo.MessageStore, limit: 1
````

## Inserting a record into the MySQL database

````
iex(1)> import Ecto.Query
nil
iex> %Repo.MessageStore{payload: "this is a message"} |> Repo.insert
````
