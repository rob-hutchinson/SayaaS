require 'httparty'


url = "http://localhost:4567" # update this if needed

HTTParty.post "#{url}/cellos", body: { phrase: 'Droid' }
sleep 1

HTTParty.post "#{url}/badnews", body: { phrase: 'Daisy, Daisy, give me your answer do' }
sleep 1

# Add other examples here
puts HTTParty.get "#{url}/log?limit=5"