class Group < ApplicationRecord
  validates :name, presence: :true
  has_many :messages, dependent: :destroy

  scope :search, -> (parameter) { where("LOWER(name) like ?", "%#{parameter.downcase}%") }
end
