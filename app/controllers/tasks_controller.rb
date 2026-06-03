class TasksController < ApplicationController
    def create
        @task = current_user.tasks.new(task_params)
      
        if @task.save
          redirect_to tasks_path  # またはホーム・カレンダーなど、行き先は後で決めてOK
        else
          render :new, status: :unprocessable_entity
        end
    end

    def update
        @task = current_user.tasks.find(params[:id])
        @task.update(completed: !@task.completed)
        # タスクの完了ステータスの反転（！で否定）
        redirect_to tasks_path
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


