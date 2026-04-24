class CreateDiaries < ActiveRecord::Migration[8.1]
  def change
    create_table :diaries do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.text :content

      t.timestamps
    end
  end
end
