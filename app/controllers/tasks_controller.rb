class TasksController < ApplicationController

    def index
     @tasks = current_user.tasks
    end

    def new
     @task = Task.new
    end

    def create
     @task = current_user.tasks.new(task_params)

     if @task.save
       AchievementService.check(current_user)
       # タスク作成時にアチーブメントを呼び出す
       redirect_to tasks_path
     else
      render plain: @task.errors.inspect
     end
    end

   def update
    @task = current_user.tasks.find(params[:id])

    if @task.update(
      completed: !@task.completed
    )
      AchievementService.check(current_user)
      redirect_to tasks_path
    else
      redirect_to tasks_path,
                  alert: "更新に失敗しました"
    end
   end

    def destroy
        @task = current_user.tasks.find(params[:id])
        @task.destroy
        redirect_to tasks_path
    end

    private

    def task_params
        params.require(:task).permit(:title, :scheduled_date, :deadline, :priority, :memo, :completed)
    end

end


