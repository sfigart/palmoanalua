require_relative '../test_helper'

class RegistrationMailerTest < ActionMailer::TestCase
  tests RegistrationMailer
  
  def setup
    @reg = Registration.new
    @reg.email_address = "friend@example.com"
    @reg.player_first_name = "first"
    @reg.player_last_name = "last"
    @reg.shirt_size = "YL"
    @reg.save(validate: false)
    
    @email = RegistrationMailer.registration_complete(@reg).deliver
  end
  
  def teardown
    @reg.delete
  end
  
  test "registration_complete header parts" do
    # Send the email, then test that it got queued
    assert_equal(false, ActionMailer::Base.deliveries.empty?)
    
    # test the body of the sent email
    assert_equal ['palmoanalua@gmail.com'], @email.from
    assert_equal ['friend@example.com'], @email.to
    assert_equal 'PAL MAC Volleyball Registration Received', @email.subject
  end
  
  test "registration_complete text body" do
    # Text Email body
    text_body = @email.text_part.to_s
    
    assert_match(/Thank you for registering for the PAL MAC 2016 volleyball season/,
      text_body)
    assert_match(/Your application is being reviewed and you will be contacted by\r\nthe league coordinator./,
      text_body)  
    
    registration_number_sentence = "Registration number: #{@reg.number}"
    assert_match(registration_number_sentence, text_body)

    player_name = "Player name: #{@reg.player_name}"
    assert_match(player_name, text_body)
    
    shirt_size_sentence = "Shirt size: #{@reg.shirt_size}"
    assert_match(shirt_size_sentence, text_body)
  end
  
  test "registration_complete html body" do
    # Html Email body
    html_body = @email.html_part.to_s
    
    assert_match(/Thank you for registering for the PAL MAC 2016 volleyball season/,
      html_body)
    assert_match(/Your application is being reviewed and you will be contacted by the league coordinator./,
      html_body) 
      
    registration_number_sentence = "Registration number: #{@reg.number}"
    assert_match(registration_number_sentence, html_body)

    player_name = "Player name: #{@reg.player_name}"
    assert_match(player_name, html_body)
    
    shirt_size_sentence = "Shirt size: #{@reg.shirt_size}"
    assert_match(shirt_size_sentence, html_body)
  end
end
