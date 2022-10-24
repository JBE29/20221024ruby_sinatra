require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do #show new gossip page
    erb :new_gossip
  end

  post '/gossips/new/' do #remplir le CSV
    Gossip.new( params["gossip_author"],params["gossip_content"]).save
    redirect '/' 
  end

  get '/gossips/:id' do #show pages gossip n°1 , n° 2 
    erb :show, locals: {gossip: Gossip.find(params['id']), id: params['id']}
  end


  get '/gossips/:id/edit' do #show pages edit by gossip n°1 , n° 2 
    erb :edit, locals: {gossip: Gossip.find(params['id']), id: params['id']}
  end

  get '/gossips/:id/edit' do #update gossip content
    Gossip.update(params['id'],params['gossip_author'],params["gossip_content"])
    def self.update(id, updated_author, updated_content)
    end
    redirect '/'
  end


end # class end