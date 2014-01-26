class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string   "patient_id"
      t.text     "encode"
      t.text     "decode"
      
      t.timestamps
    end
  end
end
