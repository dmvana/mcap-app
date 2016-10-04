class ChangeInProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.change :price, :decimal, precision: 6, scale: 2
    end
  end
end
