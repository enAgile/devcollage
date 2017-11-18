class Music < Media
  class << self
    def top10(genre)
      musics_top10(genre)
    end
  end
end
