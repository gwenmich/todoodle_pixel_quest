class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.references :quest, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
