class CreateReminders < ActiveRecord::Migration[8.0]
  def change
    create_table :reminders do |t|
      t.string :name
      t.text :description
      t.date :due_date
      t.boolean :status

      t.timestamps
    end
  end
end
