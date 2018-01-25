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

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "はメールアドレスではありません")
    end
  end
end

class Inquiry < ApplicationRecord
  validates :inquirer, presence: true
  validates :email, presence: true, email: true
  validates :body, presence: true, length: { maximum: 300 }
end
