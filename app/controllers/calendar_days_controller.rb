class CalendarDaysController < ApplicationController
  before_action :authenticate_user!

  def show
    @date = Date.parse(params[:date])

    @incomplete_tasks =
  current_user.tasks.where(
    scheduled_date: params[:date],
    completed: false
  )

    @completed_tasks =
      current_user.tasks.where(
        scheduled_date: params[:date],
        completed: true
      )
      
    @task = Task.new
  end
end