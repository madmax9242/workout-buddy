class CreateChestResults < ActiveRecord::Migration
  def change
    create_table :chest_results do |t|
    	t.integer :flat_press
    	t.integer :incline_press
    	t.integer :cable_fly
    	t.integer :decline_press
    	t.integer :incline_fly
    	t.integer :stablization_pushup
    	t.integer :user_id
    end
    add_foreign_key :chest_results, :users
  end
end
