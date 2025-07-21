class RemindersController < ApplicationController
  before_action :set_reminder, only: %i[ show edit update destroy ]

  def index
    @reminders = case params[:filter]
                 when "overdue"
                   Reminder.overdue
                 when "completed"
                   Reminder.completed
                 else
                   Reminder.all.order(due_date: :asc)
                 end
  end

  def search
    query = params[:query].to_s.downcase
    @reminders = Reminder.where("lower(name) LIKE ? OR lower(description) LIKE ?", "%#{query}%", "%#{query}%")
    render :index
  end

  def show
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
        format.html { redirect_to reminder_url(@reminder), notice: "Name was successfully written in the Death Note." }
        format.json { render :show, status: :created, location: @reminder }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @reminder.update(reminder_params)
        format.html { redirect_to reminder_url(@reminder), notice: "The Death Note entry was successfully updated." }
        format.json { render :show, status: :ok, location: @reminder }
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
    end
  end

  private
    def set_reminder
      @reminder = Reminder.find(params[:id])
    end

    def reminder_params
      params.require(:reminder).permit(:name, :description, :due_date, :status)
    end
end