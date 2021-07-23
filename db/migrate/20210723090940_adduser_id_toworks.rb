class AdduserIdToworks < ActiveRecord::Migration[6.1]
  def change
    add_column :works, :user_id, :integer
  end
end
