class Block < ActiveRecord::Base
  has_many :topics

	validates :day, presence: true
	validates :time, presence: true
end
