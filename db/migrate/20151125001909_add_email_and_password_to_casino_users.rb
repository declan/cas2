class AddEmailAndPasswordToCASinoUsers < ActiveRecord::Migration
  def change
    add_column :casino_users, :email, :string
    add_column :casino_users, :encrypted_password, :string
  end
end
