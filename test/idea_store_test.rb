require_relative '../lib/idea.rb'
require_relative '../lib/idea_store.rb'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class IdeaStoreTest < MiniTest::Test

  def test_it_exists
    assert IdeaStore
  end

  def test_it_has_database_method
    assert IdeaStore.singleton_methods.include? :database
  end

  def test_it_is_a_type_of_db
    assert_kind_of YAML::Store, IdeaStore.database
  end

  def test_is_has_singleton_method_all
    assert IdeaStore.singleton_methods.include? :all
  end

  def test_all_returns_an_array
    assert_kind_of Array, IdeaStore.all
  end

  def test_it_has_singleton_method_delete
    assert IdeaStore.singleton_methods.include? :delete
  end

  def test_it_has_singleton_method_find
    assert IdeaStore.singleton_methods.include? :find
  end

  def test_singleton_method_find_returns_an_idea
    idea = IdeaStore.find(0)
    assert_kind_of Idea, idea
  end

  def test_it_has_singleton_method_update
    assert IdeaStore.singleton_methods.include? :update
  end


end

