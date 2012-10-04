class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :name
      t.integer :page_id
      t.integer :type_id
      t.string :path
      t.string :class_name
      t.timestamps
    end
  end
end
