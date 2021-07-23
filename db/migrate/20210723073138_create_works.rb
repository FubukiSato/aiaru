class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.string :image
      t.string :name
      t.string :occupation
      t.string :wage
      t.text :hours
      t.string :location
      t.text :period
      t.string :link
      t.text :note

      t.timestamps
    end
  end
end
