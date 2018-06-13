class DeleteImages < ActiveRecord::Migration
  def change
    drop_table:Images
  end
end
