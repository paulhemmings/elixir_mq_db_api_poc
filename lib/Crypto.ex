defmodule Adapter.Crypto do

  #
  # https://www.cryptocompare.com/api/
  #

  def coins() do
    "https://min-api.cryptocompare.com/data/all/coinlist"
    |> Adapter.callUrl
    |> Adapter.toBody
    |> Adapter.decodeBody
    |> Adapter.Crypto.coinList
    |> Adapter.Crypto.onlyTrading
    |> Adapter.Crypto.parseCoins

  end

  def compare(coin, currencyList) do
    currencies = Enum.join(currencyList, ",")
    "https://min-api.cryptocompare.com/data/price?fsym=#{coin}&tsyms=#{currencies}"
    |> Adapter.callUrl
    |> Adapter.toBody
  end

  def coinList(body) do
    body["Data"]
  end

  def onlyTrading(coinMap) do
    Enum.filter(coinMap, fn {symbol, detail} -> detail["IsTrading"] == true end)
  end

  def parseCoins(coinMap) do
    Enum.map(coinMap, fn {symbol, detail} -> Adapter.Crypto.short(detail) end)
  end

  def short(detail) do
    %{
      :coin_name => detail["CoinName"],
      :coin_id => detail["Id"],
      :image_url => detail["ImageUrl"],
      :is_trading => to_string(detail["IsTrading"]),
      :symbol => detail["Symbol"],
      :total_coin_supply => detail["TotalCoinSupply"],
      :url => detail["Url"]
    }
  end



end
