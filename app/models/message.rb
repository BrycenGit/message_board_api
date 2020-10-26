class Message < ApplicationRecord
  validates :author, presence: :true
  validates :content, presence: :true

  scope :search, -> (author_parameter) { where("LOWER(author) like ?", "%#{author_parameter.downcase}%") }
end
