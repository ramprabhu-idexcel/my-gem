module Mygem
  class Task < ActiveRecord::Base
    belongs_to :project
    belongs_to :user

    validates :title, :project_id, :user_id, presence: true
    validates :is_done, inclusion: { in: [true, false] }
  end
end

