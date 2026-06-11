class HomesController < ApplicationController
  before_action :authenticate_user!

  def show

    @urgent_tasks =
      current_user.tasks
                  .where(completed: false)
                  .where.not(deadline: nil)
                  .order(:deadline)

  end
end