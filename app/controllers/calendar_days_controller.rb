class CalendarDaysController < ApplicationController
  before_action :authenticate_user!

  def show
    @date = Date.parse(params[:date])

    @tasks = current_user.tasks.where(
      scheduled_date: @date
    )
  end
end