class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :activity
      t.string :player_first_name
      t.string :player_last_name
      t.string :father_first_name
      t.string :father_last_name
      t.string :mother_first_name
      t.string :mother_last_name
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state, :limit => 2
      t.string :zip_code, :limit => 5
      t.string :home_phone, :limit => 50
      t.string :father_work_phone, :limit => 50
      t.string :father_cell_phone, :limit => 50
      t.string :mother_work_phone, :limit => 50
      t.string :mother_cell_phone, :limit => 50
      t.string :email_address, :limit => 100
      t.string :school
      t.string :grade, :limit => 1
      t.date   :birth_date
      t.string :encrypted_birth_date
      t.integer :age
      t.string :gender, :limit => 1
      t.string :shirt_size
      t.boolean :has_medical_insurance
      t.string :medical_insurance_name
      t.string :practice_days
      t.string :volunteer_type
      t.string :parent_name_for_agreement

      t.timestamps
    end
  end
end
