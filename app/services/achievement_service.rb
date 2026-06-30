class AchievementService

 def self.unlock_task_created(user)
  count = user.tasks.count

  unlocked = []

  Achievement.where(
    condition_type: "tasks_created"
  ).each do |achievement|

    next if user.achievements.include?(achievement)

    if count >= achievement.condition_value

      user.user_achievements.create!(
        achievement: achievement,
        unlocked_at: Time.current
      )

      unlocked << achievement

    end
  end

  unlocked
end
 # 作成系の実績分

 def self.unlock_task_completed(user)

  unlocked = []

  count =
    user.tasks.where(completed: true).count

  Achievement.where(
    condition_type: "tasks_completed"
  ).each do |achievement|

    next if user.achievements.include?(achievement)

    if count >= achievement.condition_value

      user.user_achievements.create!(
        achievement: achievement,
        unlocked_at: Time.current
      )

      unlocked << achievement

    end
  end

  unlocked
end
 # 完了形の実績分

 def self.unlock_high_priority_created(user)
  count = user.tasks.where(priority: 2).count

  unlocked = []

  Achievement.where(
    condition_type: "high_priority_created"
  ).each do |achievement|

    next if user.achievements.include?(achievement)

    if count >= achievement.condition_value

      user.user_achievements.create!(
        achievement: achievement,
        unlocked_at: Time.current
      )

      unlocked << achievement

    end
  end

  unlocked
end
# 高優先度タスク作成分

def self.unlock_high_priority_completed(user)
  count = user.tasks.where(
    priority: 2,
    completed: true
  ).count

  unlocked = []

  Achievement.where(
    condition_type: "high_priority_completed"
  ).each do |achievement|

    next if user.achievements.include?(achievement)

    if count >= achievement.condition_value

      user.user_achievements.create!(
        achievement: achievement,
        unlocked_at: Time.current
      )

      unlocked << achievement

    end
  end

  unlocked
end
# 高優先度タスク完了分

 def self.check(user)

  unlocked = []

  unlocked += unlock_task_created(user)

  unlocked += unlock_task_completed(user)

  unlocked += unlock_high_priority_created(user)

  unlocked += unlock_high_priority_completed(user)

  unlocked

 end
 
end