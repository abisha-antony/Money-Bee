# frozen_string_literal: true

class CreateMainBalances < ActiveRecord::Migration[6.1]
  def change
    create_table :main_balances do |t|
      t.references :users, foreign_key: true
      t.integer :amount
      t.timestamps
    end
  end
end
