class RemoveEmailFromTutors < ActiveRecord::Migration[6.1]
  def change
    remove_column :tutors, :email, :primary_key
  end
end
