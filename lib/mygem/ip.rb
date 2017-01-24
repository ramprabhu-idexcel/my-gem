module Mygem
  class Ip < ActiveRecord::Base
    validates :ipaddress, presence: true, uniqueness: true
  end
end

