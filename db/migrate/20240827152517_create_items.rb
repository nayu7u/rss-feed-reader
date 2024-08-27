class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.string :title
      t.string :link
      t.string :description

      t.timestamps
    end
  end
end
