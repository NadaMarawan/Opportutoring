class CreateTutors < ActiveRecord::Migration[6.1]
  def change
    create_table :tutors, id: false do |t|
      t.string :name
      t.primary_key :email
      t.string :password
      #t.blob :picture
      t.string :country

      t.timestamps
    end
  end
end
