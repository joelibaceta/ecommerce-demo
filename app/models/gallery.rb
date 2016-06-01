class Gallery < ActiveRecord::Base
  belongs_to :product
  has_many :photos
  accepts_nested_attributes_for :photos
end
