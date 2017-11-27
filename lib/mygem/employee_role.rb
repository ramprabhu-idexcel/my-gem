module Mygem
  class EmployeeRole < ActiveRecord::Base
    validates :name , presence: true, uniqueness: true
  end
end
