class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :Title
      t.string :Description
      t.integer :Vote
      t.integer :Unvote
      t.text :Content
      t.references :user, index: true

      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
