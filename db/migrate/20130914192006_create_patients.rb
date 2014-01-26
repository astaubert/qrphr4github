class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string   "patient_id"
      t.string   "key"
      t.string   "first"
      t.string   "last"
      t.string   "test_data"

      t.timestamps
    end
  end
end
