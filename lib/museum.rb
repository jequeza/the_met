class Museum
  attr_reader :name,
              :exhibits

  def initialize(name)
    @name = name
    @exhibits = Array.new
  end

  def add_exhibit(exhibit_obj)
    @exhibits.push(exhibit_obj)
  end

  def recommend_exhibits(patron_obj)
    @exhibits.find_all do |exhibit|
      patron_obj.interests.include?(exhibit.name)
    end
  end
end