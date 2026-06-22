class HomesController < ApplicationController

  def top
    redirect_to home_path if user_signed_in?
  end

  def show
    authenticate_user!
   @today_tasks =
    current_user.tasks
                .where(scheduled_date: Date.current,
                       completed: false)

   @urgent_tasks =
    current_user.tasks
              .where(completed: false)
              .where(deadline: Date.current..1.week.from_now)
              .by_priority
              .order(:deadline)

   @other_tasks =
    current_user.tasks
              .where(completed: false)
              .where(deadline: nil)

   @free_tasks =
    current_user.tasks
                .where(scheduled_date: nil,
                       completed: false)

   @free_tasks_count = @free_tasks.count

   @task = Task.new

   @overdue_tasks =
    current_user.tasks
              .where(completed: false)
              .where("deadline < ?", Date.current)
              .order(:deadline)

  end
end