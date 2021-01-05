class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :password
      #t.blob :picture
      t.string :country
      t.integer :level

      t.timestamps
    end
  end
end
