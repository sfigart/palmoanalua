class AddHasPlayedYearsToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :has_played, :boolean
    add_column :registrations, :years_played, :integer
  end
end
