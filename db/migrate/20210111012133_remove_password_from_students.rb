class RemovePasswordFromStudents < ActiveRecord::Migration[6.1]
  def change
    remove_column :tutors, :password
  end
end
