module RegistrationsHelper

  def show_fields
    [
      :number,
      :player_first_name, :player_last_name,
      :father_first_name, :father_last_name,
      :mother_first_name, :mother_last_name,
      :address_line_1, :address_line_2,
      :city, :state, :zip_code,
      :home_phone, :father_cell_phone, :mother_cell_phone,
      :email_address,
      :school, :grade,
      :birth_date, :age, :gender,
      :division, :shirt_size,
      :has_played, :years_played,
      :has_medical_insurance, :medical_insurance_name,
      :priority, :practice_days,
      :volunteer_type,
      :lives_in_district, :has_geographic_exception,
      :parent_name_for_agreement,    
    ]
  end
  
  def show_technical_fields
    [
      :remote_ip,
      :method,
      :user_agent,
      :params,
      :http_referrer,
      :http_cookie,
      :request_fullpath
    ]
  end
  
  def phone_number_presence_notice(registration)
    if registration.errors.include?(:phone_number_presence)
      render :partial => 'phone_number_presence_notice'
    end
  end
  
  def to_mmddyy(birth_date)
    real_date = DateTime.strptime(birth_date,"%Y-%m-%d")
    real_date.strftime("%m/%d/%Y")
  end
  
  def format_practice_days(practice_days)
    practice_days.reject! { |d| d.empty? }
    practice_days.join(', ')
  end
  
  def format_to_hawaii(timewithzone)
    timewithzone.in_time_zone("Hawaii").strftime("%m/%d/%y %l:%M %p")
  end
  
  def ages
    4..12
  end
  
  def divisions
    [  
      ['Pinto   (4/30/2008 - 5/1/2006)', 'Pinto'],
      ['Mustang (4/30/2006 - 5/1/2004)', 'Mustang'],
      ['Bronco  (4/30/2004 - 5/1/2001)', 'Bronco']
    ]
  end
  
  def genders
    [
      ['Male', 'M'],
      ['Female', 'F']
    ]
  end
  
  def grades
    [
      ['Kindergarten', 'K'],
      ['1st grade', '1'],
      ['2nd grade', '2'],
      ['3rd grade', '3'],
      ['4th grade', '4'],
      ['5th grade', '5'],
      ['6th grade', '6'],
      ['7th grade', '7'],
      ['8th grade', '8']
    ]
  end
  
  def practice_days
    [
      ['Monday', 'M'],
      ['Tuesday', 'Tu'],
      ['Wednesday', 'W'],
      ['Thursday', 'Th'],
      ['Friday', 'F']
    ]
  end
  
  def shirt_sizes
    %w(YS YM YL AS AM AL AXL AXXL)
  end

  def volunteer_types
    [
      'Head Coach',
      'Assistant Coach',
      'Team Parent',
      'Unable to volunteer'
    ]
  end
  
  def us_states
      [
        ['Alabama', 'AL'],
        ['Alaska', 'AK'],
        ['Arizona', 'AZ'],
        ['Arkansas', 'AR'],
        ['California', 'CA'],
        ['Colorado', 'CO'],
        ['Connecticut', 'CT'],
        ['Delaware', 'DE'],
        ['District of Columbia', 'DC'],
        ['Florida', 'FL'],
        ['Georgia', 'GA'],
        ['Hawaii', 'HI'],
        ['Idaho', 'ID'],
        ['Illinois', 'IL'],
        ['Indiana', 'IN'],
        ['Iowa', 'IA'],
        ['Kansas', 'KS'],
        ['Kentucky', 'KY'],
        ['Louisiana', 'LA'],
        ['Maine', 'ME'],
        ['Maryland', 'MD'],
        ['Massachusetts', 'MA'],
        ['Michigan', 'MI'],
        ['Minnesota', 'MN'],
        ['Mississippi', 'MS'],
        ['Missouri', 'MO'],
        ['Montana', 'MT'],
        ['Nebraska', 'NE'],
        ['Nevada', 'NV'],
        ['New Hampshire', 'NH'],
        ['New Jersey', 'NJ'],
        ['New Mexico', 'NM'],
        ['New York', 'NY'],
        ['North Carolina', 'NC'],
        ['North Dakota', 'ND'],
        ['Ohio', 'OH'],
        ['Oklahoma', 'OK'],
        ['Oregon', 'OR'],
        ['Pennsylvania', 'PA'],
        ['Puerto Rico', 'PR'],
        ['Rhode Island', 'RI'],
        ['South Carolina', 'SC'],
        ['South Dakota', 'SD'],
        ['Tennessee', 'TN'],
        ['Texas', 'TX'],
        ['Utah', 'UT'],
        ['Vermont', 'VT'],
        ['Virginia', 'VA'],
        ['Washington', 'WA'],
        ['West Virginia', 'WV'],
        ['Wisconsin', 'WI'],
        ['Wyoming', 'WY']
      ]
  end
end
