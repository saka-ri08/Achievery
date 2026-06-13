class FreeTasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @incomplete_free_tasks =
      current_user.tasks
                  .where(scheduled_date: nil, completed: false)
                  .order(:deadline)

    @completed_free_tasks =
      current_user.tasks
                  .where(scheduled_date: nil, completed: true)
                  .order(updated_at: :desc)
      # 予定日がまだ入力されていないデータを抽出
      # 完了タスクと未完了タスクをわける

    @task = Task.new
  end
end