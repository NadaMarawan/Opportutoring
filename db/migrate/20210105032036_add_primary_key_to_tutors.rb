class AddPrimaryKeyToTutors < ActiveRecord::Migration[6.1]
  def change
    add_column :tutors, :id, :primary_key
  end
end
