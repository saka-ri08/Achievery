# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Achievement.create!(
  name: "初めての一歩",
  description: "タスクを1件作成した",
  condition_type: "tasks_created",
  condition_value: 1
)

Achievement.create!(
  name: "計画家",
  description: "タスクを10件作成した",
  condition_type: "tasks_created",
  condition_value: 10
)

Achievement.create!(
  name: "見習い冒険者",
  description: "タスクを10件完了した",
  condition_type: "tasks_completed",
  condition_value: 10
)

Achievement.create!(
  name: "継続の達人",
  description: "タスクを50件完了した",
  condition_type: "tasks_completed",
  condition_value: 50
)