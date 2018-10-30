defmodule PostRepo do
  use Ecto.Repo, otp_app: :elixir_mq_db_api_poc


  def test() do
    %Repo.CryptoStore{
      :coin_name => "coin_name",
      :coin_id => "coin_id",
      :image_url => "image_url",
      :is_trading => "is_trading",
      :symbol => "symbol",
      :total_coin_supply => "total_coin_supply",
      :url => "url"
    } |> PostRepo.insert
  end
  
end
