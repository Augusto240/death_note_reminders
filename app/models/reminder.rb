class Reminder < ApplicationRecord
  scope :overdue, -> { where("due_date < ? AND status = ?", Date.today, false) }
  scope :upcoming, -> { where("due_date >= ? AND status = ?", Date.today, false) }
  scope :completed, -> { where(status: true) }
  validates :name, :due_date, presence: true
  attribute :status, :boolean, default: false
end