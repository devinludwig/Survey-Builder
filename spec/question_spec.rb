require('spec_helper')

describe(Question) do
  it('validates the presence of a question') do
    question = Question.new({:text => ""})
    expect(question.save()).to(eq(false))
  end
end
