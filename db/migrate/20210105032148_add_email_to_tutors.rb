class AddEmailToTutors < ActiveRecord::Migration[6.1]
  def change
    add_column :tutors, :email, :string
  end
end
