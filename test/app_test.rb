ENV['RACK_ENV'] = 'test'

require_relative '../app/app'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'

class IdeaBoxAppTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    IdeaBoxApp
  end

  def test_it_loads_the_index_page
    get '/'
    assert last_response.ok?, "It's not ok"
  end

  def test_it_posts_without_error
    post '/', {idea: {title: 'Pizza', description: 'I love it'}}
    follow_redirect!
    assert last_response.ok?, "It's not ok"
  end

  def test_it_deletes_without_error
    delete '/0'
    follow_redirect!
    assert last_response.ok?, "It's not ok"
  end

  def test_it_loads_edit_page
    get '/:id/edit', {id: '0'}
    assert last_response.ok?
  end

  def test_submit_edit_redirects
    put '/:id'
    follow_redirect!
    assert last_response.ok?, "It's not ok"
  end
end
