module CommonModel
  class Review < ActiveRecord::Base
    belongs_to :restaurant
  end
end