class RemoveCityAndStateFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :city, :string
    remove_column :users, :state, :string
  end
end
