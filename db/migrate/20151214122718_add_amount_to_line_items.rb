class AddAmountToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :amount, :integer, default: 1
  end
end
