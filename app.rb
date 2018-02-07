# Specify gemfile Location and general variables

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)

puts ENV['BUNDLE_GEMFILE']

# Perform requiring gem that we need

######################################################################

# basic

require 'rubygems'

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])

require 'pathname'

require 'pg'

require 'active_record'

require 'sinatra'

APP_ROOT = Pathname.new(File.expand_path('../', __FILE__))

require APP_ROOT.join('config', 'database')

get '/questions/new' do
	
	erb :"home"

end

post '/create_question' do
	x = Question.new(user_name:params[:user_name], question_body:params[:question_body])
	x.save
	erb :'shows'
end


get '/questions/:id' do

  @question = Question.find(params[:id])

  erb :'show'

end

get '/questions' do

  erb :'shows'

end

get '/questions/:id/edit' do

	@question = Question.find(params[:id])

	erb :'homes'

end

post '/questions/:id' do
	@question = Question.find(params[:id])
	@question.update(user_name:params[:user_name], question_body:params[:question_body])
	

	erb :'show'
end

get '/questions/:id/delete' do
	@question = Question.find(params[:id])
	@question.destroy
end