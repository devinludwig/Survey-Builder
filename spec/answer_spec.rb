require('spec_helper')

describe(Answer) do
  it('validates the presence of an answer') do
    answer = Answer.new({:name => ""})
    expect(answer.save()).to(eq(false))
  end
end
