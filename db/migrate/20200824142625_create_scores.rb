class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.integer :point
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
