class AchievementsController < ApplicationController
  before_action :authenticate_user!

  def index
    @achievements = Achievement.all
    @unlocked_ids =
      current_user
      .user_achievements
      .pluck(:achievement_id)
       # アチーブメントIDを直接取得してRubyの配列として返す(実績数が増えたとき用)
  end
end