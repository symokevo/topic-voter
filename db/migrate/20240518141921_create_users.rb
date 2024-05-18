class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :username
      t.string :role
      t.string :email
      t.references :company, null: false, foreign_key: true
      t.boolean :approved

      t.timestamps
    end
  end
end
