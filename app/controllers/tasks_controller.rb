class TasksController < ApplicationController
    def create
        @diary = Diary.find(params[:diary_id])
        # DBから1件日記を取得し、@Diaryに渡す
        @task = @diary.tasks.new(task_params)
        # diaryに紐づくtaskオブジェクトを作成し、@taskに代入
        @task.user = current_user
        # 新しく作成するタスクの所有者を現在ログインしているユーザーにする

        if @task.save
            redirect_to @diary
            # 保存できたら日記に戻る
        else
            render "diaries/show"
            # 保存できなかったら詳細画面に戻る
        end
    end

    def update
        @task = Task.find(params[:id])
        @task.update(completed: !@task.completed)
        # タスクの完了ステータスの反転（！で否定）
        redirect_to diary_path(@task.diary)
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to diary_path(@task.diary)
    end

    private

    def task_params
        params.require(:task).permit(:content)
    end

end


