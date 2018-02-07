get '/questions/new' do
	
	erb :"new_question"

end

post '/create_question' do
	x = Question.new(user_name:params[:user_name], question_body:params[:question_body])
	x.save
	erb :'show_all_questions'
end

post '/questions/:id' do
	x = Answer.new(user_name:params[:user_name], answer_body:params[:answer_body], question_id:params[:id])
	x.save
	@question = Question.find(params[:id])
	erb :'show_one_question'
end


get '/questions/:id' do

  @question = Question.find(params[:id])

  erb :'show_one_question'

end

get '/questions' do

  erb :'show_all_questions'

end

get '/questions/:id/edit' do

	@question = Question.find(params[:id])

	erb :'update_question'

end

post '/questions/:id/edit' do
	@question = Question.find(params[:id])
	@question.update(user_name:params[:user_name], question_body:params[:question_body])
	

	erb :'show_all_questions'
end

get '/questions/:id/delete' do
	@question = Question.find(params[:id])
	@question.destroy

	erb :'show_all_questions'
end