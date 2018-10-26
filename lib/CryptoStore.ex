defmodule Repo.CryptoStore do
    use Ecto.Schema

    schema "CryptoStore" do
      field :coin_name, :string
      field :coin_id, :string
      field :image_url, :string
      field :is_trading, :string
      field :symbol, :string
      field :total_coin_supply, :string
      field :url, :string
    end

  end
