class AddCauseOfDeathToReminders < ActiveRecord::Migration[8.0]
  def change
    add_column :reminders, :cause_of_death, :string, default: "Heart Attack"
  end
end