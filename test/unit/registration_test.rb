require_relative '../test_helper'

class RegistrationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "medical_insurance_name" do
    reg = Registration.new
    reg.valid?
    assert_nil(reg.errors.include?(:medical_insurance_name))
    
    reg.has_medical_insurance = true
    reg.valid?
    assert(reg.errors.include?(:medical_insurance_name))
    assert_equal("can't be blank", reg.errors.get(:medical_insurance_name).join)

    reg.has_medical_insurance = false
    reg.valid?
    assert_nil(reg.errors.include?(:medical_insurance_name))
  end
  
  test "nil birth_date" do
    reg = Registration.new
    reg.valid?
    assert(reg.errors.include?(:birth_date))
  end

  test "valid birth_date" do
    reg = Registration.new
    reg.birth_date = "2012-01-01"
    reg = Registration.new
    reg.birth_date = "01/01/2012"
    reg.valid?
    assert_nil(reg.errors.include?(:birth_date))

    reg.birth_date = "2000-12-31"
    reg.valid?
    assert_nil(reg.errors.include?(:birth_date))
  end
  
  test "invalid birth_date" do
    reg = Registration.new
    reg.birth_date = "2012-02-31"
    reg.valid?
    assert_equal(true, reg.errors.include?(:birth_date))
    
    reg.birth_date = "2012-06-31"
    reg.valid?
    assert_equal(true, reg.errors.include?(:birth_date))
  end
  
  test "has_at_least_one_contact_phone_number" do
    reg = Registration.new
    reg.valid?
    assert_equal(true, reg.errors.include?(:phone_number_presence))
    assert_equal("must have at least one contact phone number", reg.errors.get(:phone_number_presence).join)
    
    attributes = [:home_phone,
        :father_cell_phone, :father_work_phone,
        :mother_cell_phone, :mother_work_phone]

    attributes.each do |attr|
      reg = Registration.new
      reg[attr] = "(808) 123-4567"
      reg.valid?
      assert_nil(reg.errors.include?(:phone_number_presence), "attribute: #{attr}")
    end
  end
    
  test "has_at_least_one_contact_phone_number with empty strings" do
    reg = Registration.new
    attributes = [:home_phone,
        :father_cell_phone, :father_work_phone,
        :mother_cell_phone, :mother_work_phone]
    attributes.each { |attr| reg[attr] = "" }
    
    reg.valid?
    assert_equal(true, reg.errors.include?(:phone_number_presence))
  end
end