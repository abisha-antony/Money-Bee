# frozen_string_literal: true

class AddRefColumnToExpenses < ActiveRecord::Migration[6.1]
  def change
    add_reference :expenses, :users, foreign_key: true
  end
end
