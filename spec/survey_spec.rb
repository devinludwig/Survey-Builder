require('spec_helper')

describe(Survey) do
  describe('#questions') do
    it('tells which questions are included in the survey') do
      survey = Survey.create({:name => 'Water Bottle Survey'})
      question1 = Question.create({:text => 'How long does a hydroflask keep water cold?', :survey_id => survey.id})
      question2 = Question.create({:text => 'Plastic or stainless steel?', :survey_id => survey.id})
      expect(survey.questions).to(eq([question1, question2]))
    end
  end

  it('validates the presence of a survey') do
    survey = Survey.new({:name => ""})
    expect(survey.save()).to(eq(false))
  end


  describe('#capitalize_name') do
    it('capitalizes the first letter of the name of the survey') do
      survey = Survey.create({:name => 'coffee survey'})
      expect(survey.name).to(eq('Coffee survey'))
    end
  end
end
