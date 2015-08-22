defmodule Exowm.Weather do
  use HTTPoison.Base

  @endpoint "http://api.openweathermap.org/data/2.5"

  def weather_in(city, country_code, options \\ []) do
    options_with_city = Keyword.put(options, :q, "#{city},#{country_code}")
    get("/weather", [], [params: options_with_city])
  end

  def forecast_in(city, country_code, options \\ []) do
    options_with_city = Keyword.put(options, :q, "#{city},#{country_code}")
    get("/forecast", [], [params: options_with_city])
  end

  def process_url(url) do
    @endpoint <> url
  end
end