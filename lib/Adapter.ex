defmodule Adapter do

  def callUrl(url) do
    HTTPotion.get(url)
  end

  def toBody(response) do
    response.body
  end

  def decodeBody(body) do
    Poison.decode!(body)
  end

end
