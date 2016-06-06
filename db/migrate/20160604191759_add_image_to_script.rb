class AddImageToScript < ActiveRecord::Migration
  def change
    add_column :scripts, :image_string, :string
  end
end
