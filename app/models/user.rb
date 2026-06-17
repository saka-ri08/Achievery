class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks, dependent: :destroy
  validates :name, presence: true
  has_many :user_achievements, dependent: :destroy
  has_many :achievements, through: :user_achievements
  has_many :free_tasks, dependent: :destroy
end
