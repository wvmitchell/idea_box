require_relative '../lib/idea.rb'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class IdeaTest < MiniTest::Test

  def test_it_exist
    idea = Idea.new
    assert_kind_of Idea, idea
  end

  def test_it_has_spam
    idea = Idea.new
    assert idea.methods.include? :spam
  end

end
