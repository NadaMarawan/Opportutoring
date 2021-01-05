class RemoveEmailFromStudents < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :email, :primary_key
  end
end
