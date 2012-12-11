class AddDivisionToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :division, :string
  end
end
