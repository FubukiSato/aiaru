class AddTelToWorks < ActiveRecord::Migration[6.1]
  def change
    add_column :works, :tel, :string
  end
end
