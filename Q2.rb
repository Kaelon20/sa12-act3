require 'httparty'
require 'json'

def exchange_data(currency, api_key)
    url = "https://v6.exchangerate-api.com/v6/#{api_key}/latest/#{currency}"
    response = HTTParty.get(url)
    JSON.parse(response.body)
end

def exchange_rates(exchange_data, exchange_currency, currency)
    currency_rate = exchange_data['conversion_rates'][currency]
    ex_currency_rate = exchange_data['conversion_rates'][exchange_currency]
    puts "current currency rate: #{currency_rate} and exchange currency rate: #{ex_currency_rate}"
end


def convert_amount(amount, exchange_rate, currency, exchange_currency)
    converted_amount = exchange_rate * amount
    puts "#{amount} #{currency} is equal to #{converted_amount} #{exchange_currency}"
end


exchange_currency = 'CAD'
currency = 'USD'
currency_amount = 50
api_key = 'c99940d87bb60237f598cf86'
exchange = exchange_data(currency, api_key)
exchange_rates(exchange, exchange_currency, currency)
exchange_rate = exchange['conversion_rates'][exchange_currency]
convert_amount(currency_amount, exchange_rate, currency, exchange_currency)