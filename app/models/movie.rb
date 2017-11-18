class Movie < Media
  class << self
    def top10(genre)
      movies_top10(genre)
    end
  end
end
