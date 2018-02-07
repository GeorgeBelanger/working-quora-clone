class CreateAnswers < ActiveRecord::Migration

  def change
  	create_table :answers do |t|
      t.string :user_name
      t.string :answer_body
      t.belongs_to :question, index: true, foreign_key: true
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