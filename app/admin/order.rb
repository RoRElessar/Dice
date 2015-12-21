ActiveAdmin.register Order do

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

  show do |order|
    div do
      panel('Items') do
        table_for(order.line_items) do
          column 'Изображение' do |i|
            image_tag i.product.product_image_url(:small) if i.product.product_image?
          end
          column 'Название' do |i|
            i.product.title
          end
          column 'Количество', :amount
          column 'Цена' do |i|
            number_to_currency(i.total_price)
          end
        end
      end
    end
  end

end
