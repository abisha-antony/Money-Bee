class CreateDebtRecorders < ActiveRecord::Migration[6.1]
  def change
    create_table :debt_recorders do |t|
      t.date :date
      t.string :owed_to
      t.bigint :amount
      t.string :description
      t.timestamps
    end
  end
end
