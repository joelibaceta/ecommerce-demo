ActiveAdmin.register Gallery do

  permit_params :product_id, photos_attributes: [:picture, :gallery_id]

  index do
    column :product
    column '' do |gallery|
      "Photos: #{gallery.photos.count}"
    end
  end

  form do |f|
    f.inputs 'Producto' do
      f.input :product
    end
    f.inputs 'Foto' do
      f.has_many :photos do |photo|
        photo.input :picture, as: :file
      end
    end
    f.actions
  end
end