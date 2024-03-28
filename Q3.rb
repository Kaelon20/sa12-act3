require 'httparty'
require 'json'

def event_data(api_key)
    url = "https://app.ticketmaster.com/discovery/v2/events.json?countryCode=US&apikey=#{api_key}"
    response = HTTParty.get(url)
    JSON.parse(response.body)
end

def event_info(event_data)
        puts "Name: #{event['name']['text']}"
        puts "Venue: #{event['venue']['name']}"
        puts "Date: #{event['start']['local'].split('T')[0]}" # Extracting date part from ISO8601 format
        puts "Time: #{event['start']['local'].split('T')[1]}" # Extracting time part from ISO8601 format
    end
end

api_key = 'Q7b4M4GlL35tiY6LEtsagFj7ydLe1m2j'
event_d = event_data(api_key)
event = event_info(event_d)
