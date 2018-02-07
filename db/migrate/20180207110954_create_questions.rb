class CreateQuestions < ActiveRecord::Migration

  def change
  	create_table :questions do |t|
      t.string :user_name
      t.string :question_body
    end

  end

end


      # t.string :user_story
      # t.date :answered_on
      # t.string :answer_body
      # t.integer :up_votes
      # t.integer :down_votes
      # t.datetime :created_at
      # t.datetime :updated_at