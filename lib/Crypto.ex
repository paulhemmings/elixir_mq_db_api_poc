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
    Adapter.callUrl("https://min-api.cryptocompare.com/data/price?fsym=#{coin}&tsyms=#{currencies}")
  end

  def coinList(body) do
    body["Data"]
  end

  def onlyTrading(coinMap) do
    Enum.filter(coinMap, fn {symbol, detail} -> detail["IsTrading"] == true end)
  end

  def parseCoins(coinMap) do
    Enum.map(coinMap, fn {symbol, detail} -> %{symbol => Adapter.Crypto.short(detail)} end)
  end

  def short(detail) do
    %{
      "CoinName" => detail["CoinName"],
      "Id" => detail["Id"],
      "ImageUrl" => detail["ImageUrl"],
      "IsTrading" => detail["IsTrading"],
      "Name" => detail["Name"],
      "Symbol" => detail["Symbol"],
      "TotalCoinSupply" => detail["TotalCoinSupply"],
      "Url" => detail["Url"]
    }
  end



end
