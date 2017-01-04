module Mygem
  class Quiz < ActiveRecord::Base
    #serialize :options, Array
    validates :question, :answer, :type, :options, presence: true
  end
end
