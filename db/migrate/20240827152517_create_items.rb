class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.string :title
      t.string :link
      t.string :description
      t.belongs_to :feed, foreign_key: true

      t.timestamps
    end

    add_index :items, [ :link, :feed_id ], unique: true
  end
end
