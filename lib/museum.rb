class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = Array.new
    @patrons = Array.new
  end

  def add_exhibit(exhibit_obj)
    @exhibits.push(exhibit_obj)
  end

  def recommend_exhibits(patron_obj)
    @exhibits.find_all do |exhibit|
      patron_obj.interests.include?(exhibit.name)
    end
  end

  def admit(patron_obj)
    @patrons.push(patron_obj)
  end

  def patrons_by_exhibit_interest
    patrons_exhibit = Hash.new(0)
    @exhibits.each do |exhibit|
      patrons_exhibit[exhibit] = []
      @patrons.each do |patron|
        patrons_exhibit[exhibit].push(patron) if patron.interests.include?(exhibit.name)
      end
    end
    patrons_exhibit
  end
end