class Block < ActiveRecord::Base
  has_many :topics, dependent: :delete_all

	validates :day, presence: true
	validates :time, presence: true
end
