class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table(:surveys) do |s|
      s.column(:name, :string)

    end
  end
end
