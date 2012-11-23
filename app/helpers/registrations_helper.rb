module RegistrationsHelper

  def to_mmddyy(birth_date)
    real_date = DateTime.strptime(birth_date,"%Y-%m-%d")
    real_date.strftime("%m/%d/%Y")
  end
  
  def format_practice_days(practice_days)
    practice_days.reject! { |d| d.empty? }
    practice_days.join(', ')
  end
  
  def ages
    4..12
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
      ['6th grade', '6']
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
