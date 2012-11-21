require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  setup do
    @registration = registrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registration" do
    assert_difference('Registration.count') do
      post :create, registration: { address_line_1: @registration.address_line_1, address_line_2: @registration.address_line_2, age: @registration.age, birth_date: @registration.birth_date, city: @registration.city, email_address: @registration.email_address, father_cell_phone: @registration.father_cell_phone, father_first_name: @registration.father_first_name, father_last_name: @registration.father_last_name, gender: @registration.gender, grade_id: @registration.grade_id, home_phone: @registration.home_phone, medical_insurance_name: @registration.medical_insurance_name, medical_insurance_plan: @registration.medical_insurance_plan, mother_cell_phone: @registration.mother_cell_phone, mother_first_name: @registration.mother_first_name, mother_last_name: @registration.mother_last_name, parent_name_for_agreement: @registration.parent_name_for_agreement, player_first_name: @registration.player_first_name, player_last_name: @registration.player_last_name, practice_days: @registration.practice_days, school: @registration.school, shirt_size_id: @registration.shirt_size_id, state_id: @registration.state_id, volunteer_type_id: @registration.volunteer_type_id, zip_code: @registration.zip_code }
    end

    assert_redirected_to registration_path(assigns(:registration))
  end

  test "should show registration" do
    get :show, id: @registration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registration
    assert_response :success
  end

  test "should update registration" do
    put :update, id: @registration, registration: { address_line_1: @registration.address_line_1, address_line_2: @registration.address_line_2, age: @registration.age, birth_date: @registration.birth_date, city: @registration.city, email_address: @registration.email_address, father_cell_phone: @registration.father_cell_phone, father_first_name: @registration.father_first_name, father_last_name: @registration.father_last_name, gender: @registration.gender, grade_id: @registration.grade_id, home_phone: @registration.home_phone, medical_insurance_name: @registration.medical_insurance_name, medical_insurance_plan: @registration.medical_insurance_plan, mother_cell_phone: @registration.mother_cell_phone, mother_first_name: @registration.mother_first_name, mother_last_name: @registration.mother_last_name, parent_name_for_agreement: @registration.parent_name_for_agreement, player_first_name: @registration.player_first_name, player_last_name: @registration.player_last_name, practice_days: @registration.practice_days, school: @registration.school, shirt_size_id: @registration.shirt_size_id, state_id: @registration.state_id, volunteer_type_id: @registration.volunteer_type_id, zip_code: @registration.zip_code }
    assert_redirected_to registration_path(assigns(:registration))
  end

  test "should destroy registration" do
    assert_difference('Registration.count', -1) do
      delete :destroy, id: @registration
    end

    assert_redirected_to registrations_path
  end
end
