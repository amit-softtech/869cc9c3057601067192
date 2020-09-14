class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :q_type
      t.integer :topic_id
      t.integer :user_id

      t.timestamps
    end
  end
end
