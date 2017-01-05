module Mygem
  class Quiz < ActiveRecord::Base
    serialize :options, Array if ActiveRecord::Base.connection.adapter_name == "Mysql2"
    validates :question, :answer, :type, :options, presence: true
  end
end
