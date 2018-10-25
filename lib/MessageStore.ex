defmodule Repo.MessageStore do
    use Ecto.Schema

    schema "MessageStore" do
      field :payload, :string
    end
  end
