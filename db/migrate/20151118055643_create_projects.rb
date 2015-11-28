class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string  :name
      t.string  :en_name
      t.string  :title
      t.string  :en_title
      t.text  :description
      t.text  :en_description  
      t.timestamps null: false
    end
  end
end
