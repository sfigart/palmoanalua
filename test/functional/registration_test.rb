require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  def setup
    @registration = Registration.new
    @registration.email_address = "friend@example.com"
    @registration.player_first_name = "first"
    @registration.player_last_name = "last"
    @registration.shirt_size = "YL"
    @registration.save(validate: false)
  end
  
  def teardown
    @registration.delete
  end
  
  def test_thankyou
    get :thankyou, :id => @registration.id
    assert_response :success
    assert_select('p', /Thank you/)
    assert_select('p', /Your registration number is\n#{@registration.number}/)
    assert_select('p', /Player name: #{@registration.player_name}/)
    assert_select('p', /Shirt size: #{@registration.shirt_size}/)
  end
end