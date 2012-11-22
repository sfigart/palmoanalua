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
end
