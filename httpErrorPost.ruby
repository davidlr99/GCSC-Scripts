require 'net/http'
require 'net/https'
require 'uri'

puts "HTTP ERROR POST";
postValues = {}
headerValues = {}


puts "To which addres (IP or URL) do you want to post this ?"
urltyped = gets.chomp;

url = URI.parse(urltyped)
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true #Turn OFF if you want :D

puts "How many header fields ?"
headersCount = gets.chomp
headers = []

i = 0;
while i < headersCount.to_i
  anzeige = i+=1;
  puts "The #{anzeige}. headerfield name:"
  name = gets.chomp
  headers.push(name)
  i+=1
end

puts "What post-variables do you want to post? Replace the varaiable content with ?  (e.g user=?&pass=?&time=?)."
data = gets.chomp;

contents = File.read('errorlist.txt')
lines = contents.split("\n")

lines.each do |line|
  headerValues= {}
  if line == "longAAA"
    line="A"*9000
  end
  for headername in headers
    headerValues.store(headername, line)
  end

#  headerValues.store("Content-Type", "application/x-www-form-urlencoded")






  postdata = data.gsub("?", line)
  resp = http.post(url.path, postdata, headerValues)
  puts "\n\n\n"
  puts resp

  responseheaders = resp.to_hash
  puts "\nPosted: #{postdata}";
  puts "\nHeaders:\n#{responseheaders}";
  puts "\nBody:\n#{resp.body}"
  sleep 0.5
end
