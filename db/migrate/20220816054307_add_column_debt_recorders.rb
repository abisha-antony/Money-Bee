# frozen_string_literal: true

class AddColumnDebtRecorders < ActiveRecord::Migration[6.1]
  def change
    add_reference :debt_recorders, :users
  end
end
