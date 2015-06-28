class CreateLegsResults < ActiveRecord::Migration
  def change
    create_table :legs_results do |t|
    	t.integer :back_squat
    	t.integer :calf_raises
    	t.integer :leg_press
    	t.integer :leg_curls
    	t.integer :leg_extensions
    	t.integer :lunges
    	t.integer :user_id
    end
    add_foreign_key :legs_results, :users
  end
end
