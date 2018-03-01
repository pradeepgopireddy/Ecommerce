class CreateCoupans < ActiveRecord::Migration[5.1]
  def change
    create_table :coupans do |t|
      t.string :code
      t.integer :discount
      t.datetime :expriry_date

      t.timestamps
    end
  end
end
