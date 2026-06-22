class Task < ApplicationRecord
  belongs_to :user
  # タスクはユーザーに属する
  
  validates :title, presence: true
  # validates :priority, inclusion: { in: 0..2 }
  # 名前は空にしない

  enum :priority, { low: 0, medium: 1, high: 2 }, prefix: true
  # 優先度ステータス

    def priority_class
    if priority_high?
      "priority-high"

    elsif priority_medium?
      "priority-medium"

    else
      "priority-low"
    end
  end

  def priority_label
   case priority
   when "high"
    "Boss"
   when "medium"
    "Normal"
   else
    "Easy"
   end
  end

 scope :by_priority, -> {
  order(
    Arel.sql(
      "CASE priority
       WHEN 'high' THEN 1
       WHEN 'medium' THEN 2
       WHEN 'low' THEN 3
       ELSE 4
       END"
    )
  )
}

def days_left
  return nil if deadline.nil?

  (deadline - Date.current).to_i
end

 def deadline_class
  return "deadline-none" if deadline.nil?

  if days_left < 0
    "deadline-overdue"

  elsif days_left == 0
    "deadline-today"

  elsif days_left <= 2
    "deadline-soon"

  else
    "deadline-normal"
  end
 end

 def deadline_label
  return "期限なし" if deadline.nil?

  if days_left < 0
    "❌期限超過"

  elsif days_left == 0
    "🔥今日締切"

  elsif days_left == 1
    "⚠明日締切"

  else
    "📅あと#{days_left}日"
  end
 end

end


