class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.bigint "user_id"
      t.index ["user_id"], name: "index_users_on_user_id"

      t.timestamps
    end
  end
end
