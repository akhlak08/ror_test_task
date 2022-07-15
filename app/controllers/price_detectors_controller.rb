class PriceDetectorsController < ApplicationController

  def current_price
    url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=USD&order=market_ca
p_desc&per_page=100&page=1&sparkline=false"
    resp = JSON.parse(HTTParty.get(url).body)
    resp[0]["current_price"]
    # render json: { data: { price: resp[0]["current_price"] } }, status: 200
  end
end
