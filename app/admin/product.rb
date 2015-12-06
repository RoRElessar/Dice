ActiveAdmin.register Product do
  permit_params :title, :description, :price, :product_image, :position, :category_id

  index do
    column :id
    column 'Изображение' do |product|
      image_tag product.product_image_url(:small) if product.product_image?
    end
    column 'Название', :title
    column 'Цена', :price
    column 'Добавлен'
    actions
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
