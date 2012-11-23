class Registration < ActiveRecord::Base

  attr_accessible :activity, :address_line_1, :address_line_2, :age, :birth_date, :city, :email_address, :father_cell_phone, :father_first_name, :father_last_name, :gender, :grade, :home_phone, :medical_insurance_name, :has_medical_insurance, :mother_cell_phone, :father_work_phone, :mother_work_phone, :mother_first_name, :mother_last_name, :parent_name_for_agreement, :player_first_name, :player_last_name, :practice_days, :school, :shirt_size, :state, :volunteer_type, :zip_code
  attr_accessible :birth_date_as_date
  serialize :practice_days
  attr_encrypted :birth_date, :key => 'something secret!'
  
  validates :player_last_name, :player_first_name,
                :father_last_name, :father_first_name,
                :mother_last_name, :mother_first_name,
                :address_line_1, :city, :state,
                :home_phone,
                :father_cell_phone, :father_work_phone,
                :mother_cell_phone, :mother_work_phone,
                :email_address, :school, :grade,
                :age, :gender,
                :shirt_size,
                :parent_name_for_agreement,
                :volunteer_type,
                :presence => true
  validates_date :birth_date
  validates :zip_code,      :presence => true, :numericality => { :only_integer => true }
  validates :email_address, :presence => true, :email => true
  validates :has_medical_insurance, :inclusion => {:in => [true, false], :message => "can't be blank"}
  validates :medical_insurance_name, :presence => true, :if => :medical_insurance_name_required?

  def medical_insurance_name_required?
    has_medical_insurance
  end
  
  def number
    "2013VB%03d" % self.id unless self.new_record?
  end
  
  def player_name
    "#{player_first_name} #{player_last_name}"
  end
  
  def birth_date_as_date=(value)
    self.birth_date = value
  end
  
  def birth_date_as_date
    Date.strptime(self.birth_date, '%F')
  end
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names.map(&:humanize)
      self.all.each do |record|
        csv << record.attributes.values_at(*column_names)
      end
    end
  end
end
