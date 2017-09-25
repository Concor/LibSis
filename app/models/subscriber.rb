class Subscriber < ApplicationRecord
  belongs_to :library
  has_many :issues
  has_many :books, through: :issues
  validates :number, presence: true
  validates :sname, presence: true
  validates :fname, presence: true
  validates :address, presence: true
  validates :phone, presence: true
end
