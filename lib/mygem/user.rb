module Mygem

  module UserScope
    extend ActiveSupport::Concern
    included do
      before_update :generate_token
      has_many :events, dependent: :destroy
      validates :first_name, :last_name, :email, :username, :phone, :age, presence: true
      validates :username, :email, uniqueness: true
      validates :password, :password_confirmation, presence: true, on: :create
      validates :password, confirmation: true
    end

    def name
      first_name + last_name
    end

    protected

    def generate_token
      self.token = loop do
        random_token = SecureRandom.urlsafe_base64(nil, false)
        break random_token unless self.class.exists?(token: random_token)
      end
    end
  end

  class User < ActiveRecord::Base
    include UserScope
  end

end