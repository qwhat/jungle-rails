class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
  #handles the email that is sent to the user when they finish their purchase
  def receipt_email(user, order, products)
    @user = user
    @order = order
    @products = products
    @url = "http://0.0.0.0:3000/orders/#{@order.id}"
    mail(to: @user.email, subject: 'Order Receipt')
  end
end
