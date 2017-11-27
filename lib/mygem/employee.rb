module Mygem
  class Employee < ActiveRecord::Base
    include ActionView::Helpers::NumberHelper
    GENDER = ['male', 'female']
    validates :first_name, :last_name, :gender, :dob,
              :joining_date, :place_of_birth,
              :designation_id, :salary,
              :total_experience, :citizenship, :active, presence: true

    validates_format_of :dob, :with => /\d{4}\-\d{2}\-\d{2}/, :message => '^Date must be in the following format: yyyy/mm/dd', if: Proc.new { |date| date.dob.present? }
    validates_format_of :joining_date, :with => /\d{4}\-\d{2}\-\d{2}/, :message => '^Date must be in the following format: yyyy/mm/dd', if: Proc.new { |date| date.joining_date.present? }
    has_many :resources, class_name: 'Employee', foreign_key: :manager_id
    belongs_to :manager, class_name: 'Employee'
    belongs_to :designation, class_name: 'EmployeeRole'
    has_one :employee_contact, foreign_key: :person_id, dependent: :destroy

    def age
      now = Time.now.utc.to_date
      now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    end

    def name
      "#{first_name} #{last_name}"
    end

    def salary_with_precision
      number_with_delimiter(salary)
    end
  end
end

