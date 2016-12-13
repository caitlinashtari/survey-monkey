require('spec_helper')

describe(Survey) do
  describe('#questions') do
    it('returns all of the questions for the given survey') do
      survey = Survey.create({:name => "Favorites"})
      question1 = Question.create({:number => 1, :survey_id => survey.id, :question => "What is your favorite weiner?"})
      question2 = Question.create({:number => 2, :survey_id => survey.id, :question => "What is your favorite noodle?"})
      expect(survey.questions()).to(eq([question1, question2]))
    end
  end


  describe('#redundant?') do
    it('checks if a survey name is already entered in the database') do
      survey1 = Survey.create({:name => "Favorites"})
      survey2 = Survey.create({:name => "Favorites"})
      survey2.redundant?()
      expect(errors.name()).to(eq())
    end
  end
end
