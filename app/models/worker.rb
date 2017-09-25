class Worker < ApplicationRecord
  belongs_to :library
  mount_uploader :avatar, AvatarUploader
  validates :sname, presence: true
  validates :fname, presence: true
  validates :post, presence: true
end