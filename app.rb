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
  Survey.create({:name => params.fetch('new_survey')})
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
