require("sinatra")
require("sinatra/reloader")
require('sinatra/activerecord')
also_reload("lib/**/*.rb")
require("./lib/survey")
require("./lib/question")
require("./lib/answer")
require("pg")
require('pry')

get('/') do

  erb(:index)
end

post('/new_survey') do
  @survey = Survey.create({:name => params.fetch('survey_name')})
  if @survey.save()
    erb(:index)
  else
    erb(:errors)
  end
end


get('/survey/:id') do
  @survey = Survey.find(params.fetch('id').to_i())
  erb(:survey)
end

post('/survey/:id/new_question') do
  @survey = Survey.find(params.fetch('id').to_i())
  @tom = Question.create({:text => params.fetch('question_text'), :survey_id => @survey.id})
  if @tom.save()
    erb(:survey)
  else
    erb(:errors)
  end
end

patch('/change_name/:id') do
  @survey = Survey.find(params.fetch('id').to_i())
  error = @survey.update({:name => params.fetch('new_name')})
  if error
    erb(:survey)
  else
    erb(:errors)
  end
end

delete('/delete/:id') do
  @survey = Survey.find(params.fetch('id').to_i())
  @survey.delete
  erb(:index)
end

delete('/survey/:id/delete/:q_id') do
  @survey = Survey.find(params.fetch('id').to_i)
  question = Question.find(params.fetch('q_id').to_i)
  question.delete
  erb(:survey)
end

patch('/survey/:id/update/:q_id') do
  @survey = Survey.find(params.fetch('id').to_i)
  question = Question.find(params.fetch('q_id').to_i)
  question.update({:text => params.fetch('new_question')})
  erb(:survey)
end

get('/question/:id') do
  @question = Question.find(params.fetch('id').to_i)
  erb(:question)
end

post('/new_answer/:id') do
  @question = Question.find(params.fetch('id').to_i)
  error = Answer.create({:name => params.fetch('answer'), :question_id => params.fetch('id').to_i})
  if error.save()
    erb(:question)
  else
    erb(:errors)
  end
end
