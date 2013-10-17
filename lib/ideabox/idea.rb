class Idea

  attr_reader :title, :description

  def initialize(params={})
    @title = params["title"]
    @description = params["description"]
  end

end
