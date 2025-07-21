class RemindersController < ApplicationController
  before_action :set_reminder, only: %i[ show edit update destroy ]

  def index
    @reminders = case params[:filter]
                 when "overdue"
                   Reminder.overdue
                 when "completed"
                   Reminder.completed
                 when "upcoming"
                   Reminder.upcoming
                 else
                   Reminder.all.ordered_by_due_date
                 end
                 
    if params[:query].present?
      @reminders = @reminders.search_by_name(params[:query])
    end

    if params[:cause_of_death].present? && column_exists?(:cause_of_death)
      @reminders = @reminders.by_cause_of_death(params[:cause_of_death])
    end
  end

  def show
    @execution_quotes = [
      "All humans will, without exception, eventually die.",
      "I'll solve equations with my right hand and write names with my left.",
      "This world is rotten, and those who are making it rot deserve to die.",
      "I'll take a potato chip... AND EAT IT!",
      "In this world, there are very few people who actually trust each other.",
      "The human whose name is written in this note shall die.",
      "The god of death... the original owner of the Death Note.",
      "I am Justice!",
      "I'll create a perfect world."
    ]
    @random_quote = @execution_quotes.sample
  end

  def new
    @reminder = Reminder.new
  end

  def edit
  end

  def create
    @reminder = Reminder.new(reminder_params)

    respond_to do |format|
      if @reminder.save
        format.html { redirect_to reminder_url(@reminder), notice: "The name has been written in the Death Note." }
        format.json { render :show, status: :created, location: @reminder }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @reminder.update(reminder_params)
        format.html { redirect_to reminder_url(@reminder), notice: "The Death Note entry was successfully modified." }
        format.json { render :show, status: :ok, location: @reminder }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reminder.destroy

    respond_to do |format|
      format.html { redirect_to reminders_url, notice: "The name was erased from the Death Note." }
      format.json { head :no_content }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@reminder) }
    end
  end

  def statistics
    @total_count = Reminder.count
    @executed_count = Reminder.where(status: true).count
    @pending_count = Reminder.where(status: false).count
    @overdue_count = Reminder.overdue.count
    @upcoming_count = Reminder.upcoming.count

    @execution_rate = @total_count > 0 ? (@executed_count.to_f / @total_count * 100).round(1) : 0

    @recent_executions = Reminder.completed.recent

    @death_causes = if column_exists?(:cause_of_death)
                      Reminder.completed.group(:cause_of_death).count
                    else
                      {}
                    end
  end

  def rules
  end

  private
    def set_reminder
      @reminder = Reminder.find(params[:id])
    end

    def reminder_params
      if column_exists?(:cause_of_death)
        params.require(:reminder).permit(:name, :description, :due_date, :status, :cause_of_death)
      else
        params.require(:reminder).permit(:name, :description, :due_date, :status)
      end
    end

    def column_exists?(column_name)
      Reminder.column_names.include?(column_name.to_s)
    end
end