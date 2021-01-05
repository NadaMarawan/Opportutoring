class CreateTutors < ActiveRecord::Migration[6.1]
  def change
    create_table :tutors do |t|
      t.string :name
      t.string :email
      t.string :password
      t.BLOB :picture
      t.string :country

      t.timestamps
    end
  end
end
