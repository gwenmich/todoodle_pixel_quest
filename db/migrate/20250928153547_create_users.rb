class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :total_completed_tasks, default: 0
      t.integer :current_knight_position, default: 0

      t.timestamps
    end
  end
end
