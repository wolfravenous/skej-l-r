class Topic < ActiveRecord::Base
  belongs_to :block

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 1000, minimum: 10 }
end
