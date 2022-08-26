class AddUserIdToCategories < ActiveRecord::Migration[7.0]
  def change
    change_table :categories do |t|
      t.belongs_to :user
    end
  end
end
