class Message < ApplicationRecord
  validates :author, presence: :true
  validates :content, presence: :true
  belongs_to :group

  scope :search, -> (author_parameter) { where("LOWER(author) like ?", "%#{author_parameter.downcase}%") }
  scope :date_search, -> (date1, date2) { where("created_at between '#{date1}' and '#{date2}'")}
end

# '2018-01-31'
