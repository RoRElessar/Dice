class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  belongs_to :cart

  PAYMENT_TYPES = [ "Наличными при получении", "На карту ПриватБанка", "Другой способ оплаты" ]

  validates :name, :phone, :address, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: {with: VALID_EMAIL_REGEX}

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

end
