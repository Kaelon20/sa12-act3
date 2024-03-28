require 'httparty'
require 'json'

def weather_data(city, api_key)
    url = "http://api.weatherapi.com/v1/current.json?key=#{api_key}&q=#{city}&aqi=no"
    response = HTTParty.get(url)
    JSON.parse(response.body)
end

def weather_info(weather_data, city)
    temp = weather_data['current']['temp_f']
    humidity = weather_data['current']['humidity']
    condition = weather_data['current']['condition']['text']
    puts "Temp: #{temp}, hum: #{humidity}, con: #{condition}"
end

def average_temperature(weather_data, period)
    temperatures = []
    period.times do
      temperatures << weather_data['current']['temp_f']
      sleep(3600)
    end
    average_temperature = temperatures.sum / temperatures.size
    average_temperature.round
    puts "average temp: #{average_temperature}"
end

api_key = '4ef3d3b4c257400487753918242803'
city = "London"
period = 24

weather = weather_data(city, api_key)
weather_info(weather, city)
average_temperature(weather, period)
