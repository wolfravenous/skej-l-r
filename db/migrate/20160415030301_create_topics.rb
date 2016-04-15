class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.text :description
      t.references :block, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
