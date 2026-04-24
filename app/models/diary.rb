class Diary < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :date, presence: true
end
