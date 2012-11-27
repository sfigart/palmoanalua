class AddLivesInDistrictToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :lives_in_district, :boolean
  end
end
