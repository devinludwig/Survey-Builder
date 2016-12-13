class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table(:answers) do |table|
      table.column(:name, :string)
      table.column(:question_id, :integer)
    end
  end
end
