# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Achievement.destroy_all

Achievement.create!(
  name: "冒険の始まり",
  description: "タスクを1件作成した",
  condition_type: "tasks_created",
  condition_value: 1
)

Achievement.create!(
  name: "依頼受付中",
  description: "タスクを10件作成した",
  condition_type: "tasks_created",
  condition_value: 10
)

Achievement.create!(
  name: "クエストメーカー",
  description: "タスクを50件作成した",
  condition_type: "tasks_created",
  condition_value: 50
)

Achievement.create!(
  name: "冒険ギルド",
  description: "タスクを100件作成した",
  condition_type: "tasks_created",
  condition_value: 100
)

Achievement.create!(
  name: "見習い冒険者",
  description: "タスクを10件完了した",
  condition_type: "tasks_completed",
  condition_value: 10
)

Achievement.create!(
  name: "ベテラン冒険者",
  description: "タスクを50件完了した",
  condition_type: "tasks_completed",
  condition_value: 50
)

Achievement.create!(
  name: "勇者への道",
  description: "タスクを100件完了した",
  condition_type: "tasks_completed",
  condition_value: 100
)

Achievement.create!(
  name: "伝説の勇者",
  description: "タスクを500件完了した",
  condition_type: "tasks_completed",
  condition_value: 500
)

Achievement.create!(
  name: "試練への挑戦",
  description: "高優先度タスクを5件完了した",
  condition_type: "high_priority_completed",
  condition_value: 5
)

Achievement.create!(
  name: "試練の覇者",
  description: "高優先度タスクを20件完了した",
  condition_type: "high_priority_completed",
  condition_value: 20
)

Achievement.create!(
  name: "慎重な計画家",
  description: "高優先度タスクを10件作成した",
  condition_type: "high_priority_created",
  condition_value: 10
)

Achievement.create!(
  name: "戦略家",
  description: "高優先度タスクを30件作成した",
  condition_type: "high_priority_created",
  condition_value: 30
)