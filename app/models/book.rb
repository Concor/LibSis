class Book < ApplicationRecord
  belongs_to :library
  has_many :issues
  has_many :subscribers, through: :issues
  validates :name, presence: true
  validates :cipher, presence: true
end
