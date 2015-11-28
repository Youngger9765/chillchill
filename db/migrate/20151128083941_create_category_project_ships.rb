class CreateCategoryProjectShips < ActiveRecord::Migration
  def change
    create_table :category_project_ships do |t|
      t.integer :category_id,:index => true 
      t.integer :project_id,:index => true
      t.timestamps null: false
    end
  end
end
