class CreateAchievements < ActiveRecord::Migration[8.1]
  def change
    create_table :achievements do |t|

      t.string :name, null: false
      # 実績名

      t.text :description
      # 実績説明

      t.string :condition_type, null: false
      # 実績解除条件の種類

      t.integer :condition_value, null: false
      # 必要回数

      t.string :icon
      # アイコン画像名

      t.timestamps
    end
  end
end