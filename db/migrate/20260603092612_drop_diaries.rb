class DropDiaries < ActiveRecord::Migration[8.1]
  def change
    drop_table :diaries do |t|
      # ロールバック用 diaries
      t.integer "user_id", null: false
      t.date "date"
      t.text "content"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end