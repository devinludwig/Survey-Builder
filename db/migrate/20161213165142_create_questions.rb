class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table(:questions) do |table|
      table.column(:text, :string)
      table.column(:survey_id, :integer)
    end
  end
end
