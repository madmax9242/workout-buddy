class CreateBackResults < ActiveRecord::Migration
  def change
    create_table :back_results do |t|
    	t.integer :seated_row
    	t.integer :lat_pulldown
    	t.integer :renegade_row
    	t.integer :good_mornings
    	t.integer :deadlift
    	t.integer :deltoid_fly
    	t.integer :user_id
    end
    add_foreign_key :back_results, :users
  end
end
