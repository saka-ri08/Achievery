class DiariesController < ApplicationController
    def index
        @diaries = current_user.diaries.order(date: :desc)
    end
    # 現在ログインしているユーザーの日記を、日付の新しい順に並べ替えて取得

    def show
        @diary = current_user.diaries.find(params[:id])
        @task = Task.new
    end
    # 現在ログインしているユーザーの日記から、指定のIDの日記を一件取得
    # Taskクラスの新しいインスタンスを作成し、インスタンス変数@taskに代入
    
    def new
        @diary = Diary.new
    end
    # Diaryクラスの新しいインスタンスを作成し、インスタンス変数@diaryに代入

    def create
        @diary = current_user.diaries.new(diary_params)
        # 現在ログイン中のユーザーの日記一覧に対し、新しい日記データを、フォームから送られてきたパラメータをもとに作成
        if @diary.save
            redirect_to @diary
        else
            render :new
        end
        # 日記の保存が完了したら日記一覧に遷移
        # 失敗したら画面はそのまま
    end
end

private

def diary_params
    params.require(:diary).permit(:date, :content)
end
# ストロングパラメータ
