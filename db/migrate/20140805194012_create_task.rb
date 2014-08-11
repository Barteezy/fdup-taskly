class CreateTask < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :datetime
      t.integer :task_list_id
    end
  end
end
