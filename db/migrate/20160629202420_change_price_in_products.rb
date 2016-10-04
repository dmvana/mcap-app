class ChangePriceInProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.change :price, :integer
    end
  end
end