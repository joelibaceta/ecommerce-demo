ActiveAdmin.register Product do
  permit_params :name, :description, :price, :picture, :category_id, :subtitle, :brief



  form decorate: true do |f|
    f.inputs 'Information' do
      f.input :category
      f.input :name
      f.input :subtitle
      f.input :brief

      f.input :description, as: :html_editor
      f.input :price
      f.input :picture
    end
    f.actions
  end
end
