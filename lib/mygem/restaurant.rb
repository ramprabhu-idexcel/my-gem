module Mygem
  class Restaurant < ActiveRecord::Base
    has_many :reviews, dependent: :destroy
  end
end