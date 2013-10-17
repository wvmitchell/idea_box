require 'sinatra'
require 'ideabox'

class IdeaBoxApp < Sinatra::Base

  set :method_override, true
  set :root, 'lib/app'

  configure :development do
    register Sinatra::Reloader
  end

  not_found do
    erb :error
  end

  get '/' do
    erb :index, locals: {ideas: IdeaStore.all, idea: Idea.new}
  end

  post '/' do
    # 1. Create an idea based on the form params
    IdeaStore.create(params[:idea])
    redirect '/'
  end

  delete '/:id' do |id|
    IdeaStore.delete(id)
    redirect '/'
  end

  get '/:id/edit' do |id|
    erb :edit, locals: {id: id, idea: IdeaStore.find(id)}
  end

  put '/:id' do |id|
    IdeaStore.update(id, params[:idea])
    redirect '/'
  end
end
