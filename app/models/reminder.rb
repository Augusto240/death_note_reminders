class Reminder < ApplicationRecord

  scope :overdue, -> { where("due_date < ? AND status = ?", Date.today, false) }
  scope :upcoming, -> { where("due_date >= ? AND status = ?", Date.today, false) }
  scope :completed, -> { where(status: true) }
  scope :recent, -> { order(created_at: :desc).limit(5) }
  scope :ordered_by_due_date, -> { order(due_date: :asc) }
  scope :search_by_name, ->(query) { where("name LIKE ?", "%#{query}%") }

  if column_names.include?('cause_of_death')
    scope :by_cause_of_death, ->(cause) { where(cause_of_death: cause) }
  end

  validates :name, :due_date, presence: true
  validate :due_date_cannot_be_in_past, on: :create

  before_save :capitalize_name

  if column_names.include?('cause_of_death')
    attribute :cause_of_death, :string, default: "Heart Attack"
    
    CAUSES_OF_DEATH = [
      "Heart Attack", 
      "Accident", 
      "Suicide", 
      "Disease", 
      "Murder", 
      "Other"
    ]
  else
    CAUSES_OF_DEATH = []
  end

  attribute :status, :boolean, default: false
  
  private
  
  def due_date_cannot_be_in_past
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "can't be in the past")
    end
  end
  
  def capitalize_name
    self.name = name.split.map(&:capitalize).join(' ') if name.present?
  end
end