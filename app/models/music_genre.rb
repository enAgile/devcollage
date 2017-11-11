class MusicGenre < Genre
  attr_accessor *%i(id name url)

  def self.all
    music_genres
  end
end
