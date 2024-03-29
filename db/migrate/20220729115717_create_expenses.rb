# frozen_string_literal: true

class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.string :category
      t.string :description
      t.integer :amount
      t.timestamps
    end
  end
end
