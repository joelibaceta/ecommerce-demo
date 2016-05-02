ActiveAdmin.register Category do
  permit_params :name

  form decorate: true do |f|
    f.inputs 'Categoria' do
      f.input :name
    end
    f.actions
  end
end
