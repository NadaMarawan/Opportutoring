class AddPrimaryKeyToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :id, :primary_key
  end
end
