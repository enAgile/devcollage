class Genre < ApplicationRecord
  belongs_to :parent, class_name: 'Genre', required: false

  validates :name, presence: true

  class << self
    def root_genres
      where(name: %w(映画 ミュージック), parent_id: nil)
    end

    def genres(type)
      parent_genre_name = case type.to_sym
                          when  :movie
                            '映画'
                          when :music
                            'ミュージック'
                          end
      return none unless parent_genre_name

      where(parent: root_genres.find_by(name: parent_genre_name))
    end
  end

  def top10medias
    case parent.name
    when '映画'
      Movie.top10(self)
    when 'ミュージック'
      Music.top10(self)
    end
  end
end
