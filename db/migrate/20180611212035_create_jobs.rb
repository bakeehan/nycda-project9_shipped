class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
    	t.string :title
    	t.string :info
    	t.string :origin
    	t.string :destination
    	t.integer :cost
    	t.integer :containers
    	t.integer :boat_id
    	t.integer :user_id
      t.timestamps
    end
  end
end
