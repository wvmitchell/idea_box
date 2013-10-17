require_relative "./idea"
require 'yaml/store'

class IdeaStore

  def self.create(attributes)
    database.transaction do |db|
      db['ideas'] ||= []
      db['ideas'] << attributes
    end
  end

  def self.all
    raw_ideas.map do |data|
      Idea.new(data)
    end
  end

  def self.raw_ideas
    database.transaction do |db|
      db['ideas'] ||= []
    end
  end

  def self.delete(position)
    database.transaction do
      database['ideas'].delete_at(position.to_i)
    end
  end

  def self.find(position)
    idea_hash = database.transaction do
      database['ideas'].at(position.to_i)
    end
    Idea.new(idea_hash)
  end

  def self.update(position, data)
    database.transaction do
      database['ideas'][position.to_i]=data
    end
  end

  def self.database
    @database ||= YAML::Store.new 'db/ideabox'
  end

end
