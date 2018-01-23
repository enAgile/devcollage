# == Schema Information
#
# Table name: inquiries
#
#  id         :integer          not null, primary key
#  inquirer   :string
#  email      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Inquiry < ApplicationRecord
  validates :inquirer, presence: true
  validates :email, presence: true
  validates :body, presence: true, length: { maximum: 300 }
end
