require 'net/http'
require 'net/https'
require 'uri'

puts "HTTP SENDER"

postValues = {}
headerValues = {}

puts "To which addres (IP or URL) do you want to post this ?"
urltyped = gets.chomp;
url = URI.parse(urltyped)
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true #Turn off ifyou want :D

puts "How many header fields ?"
headersCount = gets.chomp

i = 0;
while i < headersCount.to_i
  puts "The #{i+1}. headerfield name:"
  name = gets.chomp
  puts "The #{i+1}. headerfield value:"
  value = gets.chomp
  headerValues.store(name, value)
  i+=1
end

puts "What do you want to post  ?"
data = gets;


resp = http.post(url.path, data, headerValues)

responseheaders = resp.to_hash
puts "\nHeaders:\n#{responseheaders}";
puts "\nBody:\n#{resp.body}"
