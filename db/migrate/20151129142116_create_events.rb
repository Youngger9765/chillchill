class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer  :project_id
      t.string   :name
      t.string   :en_name
      t.string   :note
      t.date     :start_date
      t.date     :end_date
      t.time     :start_time
      t.time     :end_time
      t.text     :place
      t.text     :address
      t.text     :cost
      t.text     :notice
      t.timestamps null: false
    end
  end
end
