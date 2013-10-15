require_relative '../lib/idea.rb'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class IdeaTest < MiniTest::Test

  attr_reader :idea

  def setup
    @idea = Idea.new('floss', 'try flossing every day')
  end

  def test_it_exist
    assert_kind_of Idea, idea
  end

  def test_it_has_save_method
    assert idea.methods.include? :save
  end

  def test_it_has_database_method
    assert Idea.singleton_methods.include? :database
  end

  def test_it_is_a_type_of_db
    assert_kind_of YAML::Store, Idea.database
  end

  def test_it_stores_new_ideas_to_the_database
    idea.save
    idea_hash = idea.database.transaction {idea.database['ideas']}.last
    assert_equal  'floss', idea_hash[:title]
    assert_equal 'try flossing every day', idea_hash[:description]
  end

  def test_is_has_singleton_method_all
    assert Idea.singleton_methods.include? :all
  end

  def test_all_returns_an_array
    assert_kind_of Array, Idea.all
  end

end
