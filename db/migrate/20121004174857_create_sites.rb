class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :description
      t.string :url
      t.integer :template_id
      t.timestamps
    end
  end
end
