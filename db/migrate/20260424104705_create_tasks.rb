class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :diary, null: false, foreign_key: true
      t.string :content
      t.boolean :completed

      t.timestamps
    end
  end
end
