class Issue < ApplicationRecord
  belongs_to :book
  belongs_to :subscriber
  #validates :number, presence: true
  validates :d_start, presence: true
end
