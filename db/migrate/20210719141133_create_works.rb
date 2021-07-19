class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.string :image
      t.string :stname
      t.string :occupation
      t.integer :Salary
      t.integer :OFhours
      t.string :location
      t.string :treatment
      t.string :period

      t.timestamps
    end
  end
end
