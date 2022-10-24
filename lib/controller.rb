require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  
  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do #remplir le CSV
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
    redirect '/'
    
  end

end # class end