class AddGeographicExceptionToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :has_geographic_exception, :boolean
  end
end
