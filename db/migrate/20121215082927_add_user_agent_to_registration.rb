class AddUserAgentToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :remote_ip, :string
    add_column :registrations, :method, :string
    add_column :registrations, :user_agent, :text
    add_column :registrations, :params, :text
    add_column :registrations, :http_referrer, :string
    add_column :registrations, :http_cookie, :text
    add_column :registrations, :request_fullpath, :string
  end
end
