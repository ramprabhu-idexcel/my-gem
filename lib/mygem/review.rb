module Mygem
  class Review < ActiveRecord::Base
    belongs_to :restaurant
    belongs_to :user
    validates :rating, inclusion: { in: 1..5, message: 'rating must be between 1..5' }
  end
end