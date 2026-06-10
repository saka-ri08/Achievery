class Task < ApplicationRecord
  belongs_to :user
  # タスクはユーザーに属する
  
  validates :title, presence: true
  # validates :priority, inclusion: { in: 0..2 }
  # 名前は空にしない

  enum :priority, { low: 0, medium: 1, high: 2 }, prefix: true
  # 優先度ステータス
end


