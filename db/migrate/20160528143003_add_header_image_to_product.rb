class AddHeaderImageToProduct < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :header_image
    end
  end

  def self.down
    remove_attachment :products, header_image
  end
end
