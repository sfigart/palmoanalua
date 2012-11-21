class Registration < ActiveRecord::Base
  attr_accessible :activity, :address_line_1, :address_line_2, :age, :birth_date, :city, :email_address, :father_cell_phone, :father_first_name, :father_last_name, :gender, :grade, :home_phone, :medical_insurance_name, :have_medical_insurance, :mother_cell_phone, :mother_first_name, :mother_last_name, :parent_name_for_agreement, :player_first_name, :player_last_name, :practice_days, :school, :shirt_size, :state, :volunteer_type, :zip_code
  serialize :practice_days
  validates :player_last_name, :player_first_name,
            :father_last_name, :father_first_name,
            :mother_last_name, :mother_first_name,
            :address_line_1, :city, :state,
            :home_phone, :father_cell_phone, :mother_cell_phone,
            :email_address, :school, :grade,
            :birth_date, :age, :gender,
            :shirt_size,
            :have_medical_insurance,
            :medical_insurance_name,
            :parent_name_for_agreement,
            :presence => true
              
    validates :zip_code,      :presence => true, :numericality => { :only_integer => true }
    validates :email_address, :presence => true, :email => true
 
  def number
    "2013VB%03d" % self.id unless self.new_record?
  end
end
