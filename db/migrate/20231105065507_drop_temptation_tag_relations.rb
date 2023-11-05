class DropTemptationTagRelations < ActiveRecord::Migration[7.0]
  def change
    drop_table :temptation_tag_relations do |t|
      t.references :temptation
      t.references :tag
      t.timestamps
    end
  end
end
