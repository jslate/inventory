class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :unit
      t.float :unit_price

      t.timestamps
    end
  end
end
