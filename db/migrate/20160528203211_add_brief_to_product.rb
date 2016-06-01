class AddBriefToProduct < ActiveRecord::Migration
  def change
    add_column :products, :brief, :text
  end
end
