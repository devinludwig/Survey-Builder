class Answer < ActiveRecord::Base
  validates(:name, {:presence => true})
  validates(:name, {:uniqueness => true})
  belongs_to(:question)
end
