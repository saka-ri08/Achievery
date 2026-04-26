class Task < ApplicationRecord
  belongs_to :user
  belongs_to :diary
  validates :content, presence: true
end

# task →　ユーザーと日記（日付）に依存、その人のその日のタスク
# 空欄×