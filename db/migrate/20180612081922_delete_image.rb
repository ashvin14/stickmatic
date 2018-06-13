class DeleteImage < ActiveRecord::Migration
  def change
    drop_table :Images
  end
end
