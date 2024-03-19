class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn_10
      t.string :isbn_13
      t.integer :list_price
      t.string :publication_year
      t.string :publisher
      t.string :edition
      t.string :image_url
      t.integer :publisher_id

      t.timestamps
    end
  end
end
