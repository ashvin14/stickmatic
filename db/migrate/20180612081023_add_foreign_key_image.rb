class AddForeignKeyImage < ActiveRecord::Migration
  def change
    add_foreign_key :images ,:users
  end
end
