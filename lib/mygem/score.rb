module Mygem
  class Score < ActiveRecord::Base
    belongs_to :user
  end
end