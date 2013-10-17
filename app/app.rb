require 'sinatra'
require './lib/idea'

class IdeaBoxApp < Sinatra::Base

  set :method_override, true

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

  delete '/:id' do |id|
    Idea.delete(id)
    redirect '/'
  end

  get '/:id/edit' do |id|
    erb :edit, locals: {id: id, idea: Idea.find(id)}
  end

  put '/:id' do |id|
    data = {
      title: params[:idea_title],
      description: params[:idea_description]
    }
    Idea.update(id, data)
    redirect '/'
  end
end
