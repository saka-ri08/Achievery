class HomesController < ApplicationController
  before_action :authenticate_user!

  def show

    @urgent_tasks =
      current_user.tasks
                  .where(completed: false)
                  .where.not(deadline: nil)
                  .order(:deadline)
    @free_tasks_count =
     current_user.tasks.where(
      scheduled_date: nil,
      completed: false
     ).count
     
  end
end