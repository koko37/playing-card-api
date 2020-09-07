class RemoveUnique < ActiveRecord::Migration[6.0]
  def change
    remove_index :users, :last_sign_in_ip
  end
end
