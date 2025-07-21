json.extract! reminder, :id, :name, :description, :due_date, :status, :created_at, :updated_at
json.url reminder_url(reminder, format: :json)
