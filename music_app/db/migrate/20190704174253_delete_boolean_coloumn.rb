class DeleteBooleanColoumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :boolean
  end
end
