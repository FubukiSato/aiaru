class AddEmailToWorks < ActiveRecord::Migration[6.1]
  def change
    add_column :works, :email, :string
  end
end
