class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer  :project_id
      t.string   :name
      t.string   :en_name
      t.text     :introduction
      t.text     :en_introduction 
      t.text     :content
      t.text     :en_content
      t.text     :date
      t.text     :time
      t.text     :place
      t.text     :address
      t.text     :cost
      t.text     :discount
      t.text     :notice
      t.text     :tips
      t.timestamps null: false
    end
  end
end
