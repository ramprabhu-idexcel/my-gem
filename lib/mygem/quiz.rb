module Mygem
  class Quiz < ActiveRecord::Base
    validates :question, :answer, :type, :option, presence: true
  end
end
