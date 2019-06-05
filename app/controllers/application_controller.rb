require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do

      erb :index
    end

    post '/teams' do
      @team = Team.new(params[:team])

      params[:team][:heros].each do |hero|
        Superhero.new(hero)
      end

      @heros = Superhero.all

      erb :team
    end

end
