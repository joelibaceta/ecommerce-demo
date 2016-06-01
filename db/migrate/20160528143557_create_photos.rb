class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :gallery_id
      t.attachment :picture
      t.string :title
      t.timestamps null: false
    end
  end
end
