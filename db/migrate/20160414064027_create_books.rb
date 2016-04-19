class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :image
      t.text :description
      t.boolean :draft

      t.timestamps null: false
    end
  end
end
