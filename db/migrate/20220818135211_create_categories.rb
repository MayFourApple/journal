class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    drop_table :categories
    
    create_table :categories do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
