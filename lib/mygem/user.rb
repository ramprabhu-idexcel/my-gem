module Mygem

  module UserScope
    extend ActiveSupport::Concern
    included do
      has_many :events, dependent: :destroy
      validates :first_name, :last_name, :email, :username, :phone, :age, presence: true
      validates :username, :email, uniqueness: true
    end

    def name
      first_name + last_name
    end
  end

  class User < ActiveRecord::Base
    include UserScope
  end

end