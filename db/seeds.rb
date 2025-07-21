Reminder.create!([
  {
    name: "Light Yagami",
    description: "Becoming the god of the new world",
    due_date: Date.today + 7.days,
    status: false
  },
  {
    name: "L Lawliet",
    description: "Solve the Kira case",
    due_date: Date.today - 2.days,
    status: false
  },
  {
    name: "Misa Amane",
    description: "Meet the original Kira",
    due_date: Date.today + 1.day,
    status: false
  },
  {
    name: "Ryuk",
    description: "Retrieve the Death Note",
    due_date: Date.today - 5.days,
    status: true
  }
])

puts "Created #{Reminder.count} reminders"