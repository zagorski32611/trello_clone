class Cards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :nameposition
    add_column    :cards, :position, :integer
  end
end
