class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :description
      t.boolean :best_answer, { default: false }
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
