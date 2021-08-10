class RemoveStatusFromWorks < ActiveRecord::Migration[6.1]
  def change
    remove_column :works, :status, :string
  end
end
