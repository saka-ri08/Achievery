class Diary < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :date, presence: true
end

# 日記はユーザー依存
# 日記は複数のタスクを持ち、日記が削除されたらタスクも削除される
# 日付欄空欄×