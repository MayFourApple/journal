class AddDateToTasks < ActiveRecord::Migration[7.0]
  def change
    change_table :tasks do |t|
      t.date :date
    end
  end
end
