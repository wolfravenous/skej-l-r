class Block < ActiveRecord::Base
	validates :day, presence: true
	validates :time, presence: true
end
