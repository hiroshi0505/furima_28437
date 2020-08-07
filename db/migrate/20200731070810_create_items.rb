class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name
      t.text    :explanation
      t.integer :category_id
      t.integer :status_id
      t.integer :delivery_fee_id
      t.integer :region_id
      t.integer :delivery_date_id
      t.integer :price
      t.integer :user_id
      t.string  :image
      t.timestamps
    end
  end
end
