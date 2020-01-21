class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.column(:answer, :string)
      t.column(:question_id, :integer)
    end
  end
end
