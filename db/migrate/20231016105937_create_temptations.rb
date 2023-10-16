class CreateTemptations < ActiveRecord::Migration[7.0]
  def change
    create_table :temptations do |t|
      t.text :event
      t.text :talk
      t.text :cost
      t.text :get_out
      t.references :user, null:false, foreign_key:true
      t.timestamps
    end
  end
end
