class AddUidFirstLast < ActiveRecord::Migration
  def change
    add_column :users,:uid,:integer
    add_column :users,:first_name,:string  
    add_column :users,:last_name,:string
    add_column :users,:provider,:string
  end
end
