ActiveAdmin.register Order do
  permit_params :phone, :name, :email, :address, :pay_type

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
    price = 0
    div do
      panel('Товары') do
        table_for(order.line_items) do
          column 'Изображение' do |i|
            image_tag i.product.product_image_url(:cart) if i.product.product_image?
          end
          column 'Название' do |i|
            i.product.title
          end
          column 'Количество', :amount
          column 'Цена' do |i|
            price = price + i.total_price
            number_to_currency(i.total_price)
          end
        end
      end
    end

      div :class => 'panel' do
        h3 "Общая стоимость: #{number_to_currency(price)}"
        h3 "Способ оплаты: #{order.pay_type}"
        h3 "Адресс доставки: #{order.address}"
      end
  end

end
