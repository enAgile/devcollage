class Music < Media
  attr_accessor *%i(name summary rental_price price copyrights artist)
  class << self
    def top10(genre)
      musics_top10(genre)
    end
  end
end
