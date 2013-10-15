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

end
