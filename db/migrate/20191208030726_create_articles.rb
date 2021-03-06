class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.datetime :pub_date
      t.integer :feed_id
      t.text :link
      t.text :image
      t.string :url_hash

      t.timestamps
    end
    add_index :articles, :feed_id
  end
end
