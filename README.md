# Death Note Reminders

A task management application themed after the popular anime Death Note.

![Death Note](https://pa1.aminoapps.com/6845/4741809bfe026bfa7d6486935a57d9954946a1d6_hq.gif)

## Overview

Death Note Reminders transforms ordinary task management into a themed experience where:

- Each task is treated as a "name" written in the Death Note
- Due dates represent "execution dates"
- Task descriptions become "execution details"
- Completed tasks are marked as "executed"
- Overdue tasks are highlighted in red

The application provides a complete task management system with a unique, immersive theme.

## Features

- **Create, view, update and delete** entries in your Death Note
- **Mark entries as "executed"** when completed
- **Filter by status** (all, overdue, upcoming, completed)
- **Search** for specific names
- **Filter by cause of death** for better organization
- **View statistics** about your Death Note usage
- **Themed interface** inspired by the Death Note anime
- **Responsive design** that works on mobile and desktop
- **Death Note quotes** displayed randomly throughout the app

## Installation

### Prerequisites

- Ruby 3.3.8 or higher
- Rails 8.0.2 or higher
- SQLite3

### Setup

1. Clone the repository

```
git clone https://github.com/Augusto240/death_note_reminders.git 
cd death_note_reminders
```

2. Install dependencies
```
bundle install
```


3. Setup database
```
rails db:migrate
```


4. (Optional) Seed sample data
```
rails db:seed
```

5. Start the server
```
rails server
```


6. Visit http://localhost:3000 in your browser

## Usage

- **Add a new name**: Click "Add New Name" and fill out the form
- **Execute a name**: Click the "Execute" button on any reminder
- **Filter reminders**: Use the navigation links to view Overdue, Upcoming, or Completed names
- **Search**: Use the search box to find specific names
- **View statistics**: Click "Statistics" to see a summary of your Death Note usage
- **Learn the rules**: Visit the "Rules" page to understand how the Death Note works

## Project Structure

- `app/models/reminder.rb` - The core model for Death Note entries
- `app/controllers/reminders_controller.rb` - Handles all reminder-related actions
- `app/controllers/pages_controller.rb` - Handles static pages
- `app/views/reminders/` - Views for displaying and managing reminders
- `app/views/pages/` - Views for static pages
- `app/assets/stylesheets/application.css` - Custom CSS for Death Note theme

## Technologies Used

- **Ruby on Rails**: Backend framework
- **SQLite**: Database
- **Turbo**: For enhanced interactivity
- **CSS**: Custom styling for Death Note theme
- **Git**: Version control

## Future Enhancements

- User authentication system
- Dark/light theme toggle
- Sound effects for executions
- Deadline notifications
- Shinigami companion feature
- Mobile app version

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Disclaimer

This application is for entertainment purposes only and is inspired by fictional content. No actual harm is intended or encouraged.

## Acknowledgements

- Death Note anime and manga created by Tsugumi Ohba and Takeshi Obata
- Ruby on Rails framework
- Font providers: Google Fonts
- The Ruby and Rails community for their invaluable resources