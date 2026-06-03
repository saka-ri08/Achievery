class RedesignTasks < ActiveRecord::Migration[8.1]
  def change
    remove_reference :tasks, :diary, foreign_key: true

    rename_column :tasks, :content, :title

    add_column :tasks, :scheduled_date, :date
    add_column :tasks, :deadline, :date
    add_column :tasks, :priority, :integer, null: false, default: 0
    add_column :tasks, :memo, :text

    change_column_default :tasks, :completed, from: nil, to: false
    change_column_null :tasks, :completed, false, false
  end
end