class Book < ActiveRecord::Base
	belongs_to :user
	has_many :book_genres, dependent: :destroy 
	has_many :genres, through: :book_genres
	validates_uniqueness_of :name
	validates_presence_of :name, :author, :description
	mount_uploader :image, ImageUploader
end
