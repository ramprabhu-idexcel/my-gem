module Mygem
  class AdminComment < ActiveRecord::Base
    self.table_name = "active_admin_comments"
    belongs_to :review, polymorphic: true
  end
end