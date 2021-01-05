class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students, id: false do |t|
      t.string :name
      t.primary_key :email
      t.string :password
      #t.BLOB :picture
      t.string :country
      t.integer :level

      t.timestamps
    end
  end
end
