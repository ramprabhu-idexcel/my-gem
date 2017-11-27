module Mygem
  class EmployeeContact < Contact
    validates :office_email, :personal_email, :mobile_no,
              :alternate_no, :landline, :door_no,
              :street, :city, :state, :pincode,
              :emergency_contact_name, :emergency_contact_no,
              :person_id, presence: true
    validates :office_email, uniqueness: true, if: Proc.new { |email| email.present? }
    validates :personal_email, uniqueness: true, if: Proc.new { |email| email.present? }
    validates_format_of :office_email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, if: Proc.new { |email| email.office_email.present? }
    validates_format_of :personal_email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, if: Proc.new { |email| email.personal_email.present? }
    belongs_to :employee, foreign_key: :person_id
  end
end