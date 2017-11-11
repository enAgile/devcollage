class Genre
  attr_accessor :id, :name, :url

  class << self
    def all
      []
    end
  end
end
