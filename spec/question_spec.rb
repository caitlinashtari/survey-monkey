require('spec_helper')

describe(Question) do
  describe('#survey') do
    it('tells you what survey the question belongs to')do
      test_survey = Survey.create({:name => "Favorites"})
      test_question = Question.create({:number => 1, :question => "What's your favorite fruit? Mine's banana", :survey_id => test_survey.id()})
      expect(test_question.survey()).to(eq(test_survey))
    end
  end
end
