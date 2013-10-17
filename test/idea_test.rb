require_relative '../lib/idea.rb'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class IdeaTest < MiniTest::Test

  attr_reader :idea

  def setup
    @idea = Idea.new({title: 'floss', description: 'try flossing every day'})
  end

  def test_it_exist
    assert_kind_of Idea, idea
  end

end
