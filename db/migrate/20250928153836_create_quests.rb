class CreateQuests < ActiveRecord::Migration[8.0]
  def change
    create_table :quests do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.boolean :completed, default: false
      t.integer :reward_points, default: 0

      t.timestamps
    end
  end
end
