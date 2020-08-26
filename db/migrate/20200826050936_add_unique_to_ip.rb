class AddUniqueToIp < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :last_sign_in_ip, unique: true
  end
end
