class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.bigint "user_id", null: false

      
      t.timestamps

      t.index ["user_id"], name: "index_users_on_user_id"
      t.foreign_key :users, column: :user_id, on_delete: :cascade
    end
  end
end
