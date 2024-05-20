class CreateTopics < ActiveRecord::Migration[7.1]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :description
      t.datetime :target_meeting_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
