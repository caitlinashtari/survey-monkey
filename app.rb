require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/survey')
require('./lib/question')
require('pg')
require('pry')

get('/') do
  @surveys = Survey.all
  erb(:index)
end

post('/') do
  new_survey = Survey.new({:name => params.fetch('new_survey')})
  @surveys = Survey.all
  if new_survey.save()
    erb(:index)
  else
    erb(:error)
  end
end

delete('/') do
  Survey.find(params.fetch('survey_id').to_i).delete()
  @surveys = Survey.all
  erb(:index)
end

patch('/') do
  (Survey.find(params.fetch("survey_id").to_i)).update({:name => params.fetch('edit_name')})
  @surveys = Survey.all
  erb(:index)
end

get('/survey/:id') do
  @survey = Survey.find(params.fetch("id").to_i)
  erb(:survey)
end

post('/survey/:id') do
  @survey = Survey.find(params.fetch("id").to_i)
  @survey.questions.create({:question => params.fetch('new_question')})
  erb(:survey)
end

patch('/survey/:id') do
  @survey = Survey.find(params.fetch("id").to_i)
  @question = Question.find(params.fetch('question_id'))
  @question.update({:question => params.fetch('edit_question')})
  erb(:survey)
end

delete('/survey/:id') do
  @survey = Survey.find(params.fetch("id").to_i)
  @question.delete
  erb(:survey)
end

get('/edit_survey/:id') do
  @survey = Survey.find(params.fetch('id').to_i)
  erb(:edit_survey)
end

get('/edit_question/:id')do
  @survey_id = Question.find(params.fetch("id").to_i).survey_id()
  @question = Question.find(params.fetch('id').to_i())
  erb(:edit_question)
end
