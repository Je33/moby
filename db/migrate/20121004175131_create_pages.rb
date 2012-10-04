class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :path
      t.integer :site_id
      t.integer :template_id
      t.text :content
      t.timestamps
    end
  end
end
