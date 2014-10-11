class CreateLikes < ActiveRecord::Migration
    def change
    	create_table :likes, id: false do |t|
    		t.integer :hero_id
    		t.integer :victim_id
			t.timestamps
    	end
     add_index(:likes, [:hero_id, :victim_id], unique: true)
    end
end
