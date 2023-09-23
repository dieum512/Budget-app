class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.decimal :amount
      t.references :author, null: false, foreign_key: {to_table: "users"}, on_delete: :cascade
      t.references :group, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
