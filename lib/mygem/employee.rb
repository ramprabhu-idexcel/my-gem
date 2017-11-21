module Mygem
  class Employee < ActiveRecord::Base
    GENDER = ['male', 'female']
    validates :first_name, :last_name, :gender, :dob,
              :joining_date, :place_of_birth,
              :office_email, :personal_email,
              :designation, :salary,
              :total_experience, :citizenship, :active, presence: true

    validates_format_of :dob, :with => /\d{4}\-\d{2}\-\d{2}/, :message => '^Date must be in the following format: yyyy/mm/dd', if: Proc.new { |date| date.dob.present? }
    validates_format_of :joining_date, :with => /\d{4}\-\d{2}\-\d{2}/, :message => '^Date must be in the following format: yyyy/mm/dd', if: Proc.new { |date| date.joining_date.present? }
    validates :office_email, uniqueness: true, if: Proc.new { |email| email.present? }
    validates :personal_email, uniqueness: true, if: Proc.new { |email| email.present? }
    validates_format_of :office_email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, if: Proc.new { |email| email.office_email.present? }
    validates_format_of :personal_email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, if: Proc.new { |email| email.personal_email.present? }
    has_many :resources, class_name: 'Employee', foreign_key: :manager_id
    belongs_to :manager, class_name: 'Employee'

    def age
      now = Time.now.utc.to_date
      now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    end

    def name
      "#{first_name} #{last_name}"
    end
  end
end

