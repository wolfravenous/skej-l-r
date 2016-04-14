class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :day
      t.string :time

      t.timestamps null: false
    end
  end
end
