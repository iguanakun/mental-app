class CreateTemptationTagRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :temptation_tag_relations do |t|
      t.references :temptation, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
