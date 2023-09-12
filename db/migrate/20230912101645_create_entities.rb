class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :authored
      t.string :name
      t.decimal :amount
      t.datetime :created_at

      t.timestamps
    end
  end
end
