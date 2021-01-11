class AddPasswordDigestToTutors < ActiveRecord::Migration[6.1]
  def change
    add_column :tutors, :password_digest, :string
  end
end
