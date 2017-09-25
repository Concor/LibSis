class Library < ApplicationRecord
	mount_uploader :avatar, AvatarUploader
	has_many :books, dependent: :destroy
	has_many :workers, dependent: :destroy
	has_many :subscribers, dependent: :destroy
	validates :number, presence: true
	validates :name, presence: true
	validates :address, presence: true
	validates :avatar, presence: true
end