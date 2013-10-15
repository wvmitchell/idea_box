require 'sinatra'
require './lib/idea'

class IdeaBoxApp < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  not_found do
    erb :error
  end

  get '/' do
    erb :index, locals: {ideas: Idea.all}
  end

  post '/' do
    # 1. Create an idea based on the form params
    idea = Idea.new(params[:idea_name], params[:idea_description])
    # 2. Store it
    idea.save
    # 3. Redirect to the index page to see all the ideas
    redirect '/'
  end

end
