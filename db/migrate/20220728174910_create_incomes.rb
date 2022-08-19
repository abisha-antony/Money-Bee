# frozen_string_literal: true

class CreateIncomes < ActiveRecord::Migration[6.1]
  def change
    create_table :incomes do |t|
      t.references :users, foreign_key: true
      t.string :description
      t.integer :amount
      t.timestamps
    end
  end
end
