require_relative '../test_helper'

class RegistrationTest < ActiveSupport::TestCase
  def setup
    @reg = Registration.new
  end

  test "medical_insurance_name" do
    @reg.valid?
    assert_nil(@reg.errors.include?(:medical_insurance_name))
    
    @reg.has_medical_insurance = true
    @reg.valid?
    assert(@reg.errors.include?(:medical_insurance_name))
    assert_equal("can't be blank", @reg.errors.get(:medical_insurance_name).join)

    @reg.has_medical_insurance = false
    @reg.valid?
    assert_nil(@reg.errors.include?(:medical_insurance_name))
  end

  test "years_played" do
    @reg.valid?
    assert_nil(@reg.errors.include?(:years_played))
    
    @reg.has_played = true
    @reg.valid?
    assert(@reg.errors.include?(:years_played))
    assert_equal("can't be blank", @reg.errors.get(:years_played).join)

    @reg.years_played = 5
    @reg.valid?
    assert_nil(@reg.errors.include?(:years_played))

    @reg.years_played = nil
    @reg.has_played = false
    @reg.valid?
    assert_nil(@reg.errors.include?(:years_played))
  end
  
  test "nil birth_date" do
    @reg.valid?
    assert(@reg.errors.include?(:birth_date))
  end

  test "valid birth_date" do
    @reg.birth_date = "2012-01-01"

    reg = Registration.new
    reg.birth_date = "01/01/2012"
    reg.valid?
    assert_nil(reg.errors.include?(:birth_date))

    reg.birth_date = "2000-12-31"
    reg.valid?
    assert_nil(reg.errors.include?(:birth_date))
  end
  
  test "invalid birth_date" do
    @reg.birth_date = "2012-02-31"
    @reg.valid?
    assert_equal(true, @reg.errors.include?(:birth_date))
    
    @reg.birth_date = "2012-06-31"
    @reg.valid?
    assert_equal(true, @reg.errors.include?(:birth_date))
  end
  
  test "has_at_least_one_contact_phone_number" do
    @reg.valid?
    assert_equal(true, @reg.errors.include?(:phone_number_presence))
    assert_equal("must have at least one contact phone number", @reg.errors.get(:phone_number_presence).join)
    
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
    attributes = [:home_phone,
        :father_cell_phone, :father_work_phone,
        :mother_cell_phone, :mother_work_phone]
    attributes.each { |attr| @reg[attr] = "" }
    
    @reg.valid?
    assert_equal(true, @reg.errors.include?(:phone_number_presence))
  end
  
  test "priority volunteer type" do
    @reg.volunteer_type = "Head Coach"
    assert_equal(1, @reg.priority)
    
    @reg.volunteer_type = "Assistant Coach"
    assert_nil(@reg.priority)
    
    @reg.volunteer_type = "Team Parent"
    assert_nil(@reg.priority)
    
    @reg.volunteer_type = "Unable to volunteer"
    assert_nil(@reg.priority)
  end
  
  test "priority lives_in_district" do
    @reg.lives_in_district = nil
    assert_nil(@reg.priority)

    @reg.lives_in_district = false
    assert_nil(@reg.priority)
        
    @reg.lives_in_district = true
    assert_equal(5, @reg.priority)
  end
  
  test "has_geographic_exception" do
    @reg.has_geographic_exception = nil
    assert_nil(@reg.priority)

    @reg.has_geographic_exception = false
    assert_nil(@reg.priority)
        
    @reg.has_geographic_exception = true
    assert_equal(10, @reg.priority)
  end

  test "priority practice_days" do
    @reg.practice_days = nil
    assert_nil(@reg.priority)
        
    @reg.practice_days = [""]
    assert_nil(@reg.priority)
    
    @reg.practice_days = ["M",""]
    assert_equal(99, @reg.priority)
    
    @reg.practice_days = ["M","W","F",""]
    assert_equal(99, @reg.priority)
  end

  # Expected Priority => 1, 99, 5, 10
  test "priority with multiple values" do
    @reg.volunteer_type = "Head Coach"   #  1
    @reg.practice_days = ["M",""]        # 99
    @reg.lives_in_district = true        #  5
    @reg.has_geographic_exception = true # 10
    assert_equal(1, @reg.priority)
    
    @reg.volunteer_type = "Unable to volunteer"
    assert_equal(99, @reg.priority)

    @reg.practice_days = [""]    
    assert_equal(5, @reg.priority)

    @reg.lives_in_district = false    
    assert_equal(10, @reg.priority)
    
    @reg.has_geographic_exception = false
    assert_equal(nil, @reg.priority)
  end
end