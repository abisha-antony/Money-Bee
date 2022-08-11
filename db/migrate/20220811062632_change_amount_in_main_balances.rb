class ChangeAmountInMainBalances < ActiveRecord::Migration[6.1]
  def change
    change_column :main_balances, :amount, :integer, default: 0
  end
end
