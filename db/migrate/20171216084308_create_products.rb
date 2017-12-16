class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price, :precision => 8, :scale => 2  # 8 为有效数字，小数点后有 2 位。

      t.timestamps
    end
  end
end
