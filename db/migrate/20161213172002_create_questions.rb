class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table(:questions) do |q|
      q.column(:question, :string)
      q.column(:number, :integer)
      q.column(:survey_id, :integer)
    end
  end
end
