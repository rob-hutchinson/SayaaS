require 'sinatra/base'
require 'pry'

class MyApp < Sinatra::Base

  LOGS = []
  
  def log info, phrase
    LOGS << [Time.now, info["REMOTE_ADDR"], phrase]
    "OK"
  end

post "/cellos"  do
  phrase = params["phrase"]
  `say -v "Cellos" "#{phrase}"`
  log(env, phrase)
end  

post "/badnews" do
  phrase = params["phrase"]
  `say -v "Bad News" "#{phrase}"`
  log(env, phrase)
end

get "/log" do
  if params["limit"].to_i >= LOGS.count
    "#{LOGS.reverse[0...params["limit"].to_i]}"
  else
    "#{LOGS}"
  end
end

end

MyApp.run!
