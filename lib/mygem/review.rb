module Mygem
  class Review < ActiveRecord::Base
    belongs_to :restaurant
    validates :rating, :inclusion => 1..5, message: 'rating must be between 1..5'
  end
end