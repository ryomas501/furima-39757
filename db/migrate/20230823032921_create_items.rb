class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :goods,            null: false
      t.text       :product,          null: false
      t.integer    :category_id,      null: false
      t.integer    :condition_id,     null: false
      t.integer    :delivery_cost_id, null: false
      t.integer    :place_id,         null: false
      t.integer    :days_to_ship_id,  null: false
      t.integer    :price,            null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps

    end
  end
end
