# == Schema Information
#
# Table name: media
#
#  id               :integer          not null, primary key
#  name             :string           not null
#  category         :string           not null
#  price_amount     :integer          not null
#  price_currency   :string           not null
#  summary          :text
#  copyrights       :string
#  artist           :string
#  image_url        :string
#  itunes_medium_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Medium < ApplicationRecord
  validates :name, :price_amount, :price_currency, presence: true
  has_many :media_rankings, dependent: :destroy
  has_many :genres, through: :media_rankings

  class << self
    # XXX
    def top10(category, genre)
      all.sample(10)
    end
  end

  # XXX image が不適切, 一覧では荒い画像でよい
  def image
    image_url.sub(/\d+x\d+bb-\d+.jpg/, '400x400bb.jpg')
  end

  # XXX title が不要
  def title
    name
  end
end
