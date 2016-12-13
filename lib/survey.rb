class Survey < ActiveRecord::Base
  has_many(:questions)
  validates(:name, {:presence => true})
  validates(:name, {:uniqueness => true})
  before_save(:capitalize_name)

private
  def capitalize_name
    self.name.capitalize!()
  end
end
