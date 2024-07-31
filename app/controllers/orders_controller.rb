class OrdersController < ApplicationController
  load_and_authorize_resource

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @book = Book.find(params[:book_id])
  end

  def create

    book = Book.find(params[:book_id])
    

    if (book.stock_quntity >= order_params[:stock_quntity].to_i)
      total = book.price + 18 + 40
      order = book.orders.create(date_submit:Time.now, status:1,subtotal:book.price, total:total, account_id:current_account.id, stock_quntity:order_params[:stock_quntity])
      if order != nil
        flash[:message] = "Order successfully placed"
        quantity = book.stock_quntity - order_params[:stock_quntity].to_i
        book.update_columns({stock_quntity:quantity})
        flash[:message] = "Order successfully placed!"
        redirect_to  :action=>"users_orders"
      else
        flash[:message] = "Somthing is wrong! Order is not place"
        redirect_to :action=>"new", status: :unprocesible_entity
      end
    else
      flash[:message] = "Please enter a valid stock quantity!"

      redirect_to :action=>"new"
    end



  end

  # def edit
  #   @order = Order.find(params[:id])
  #   @book = Book.find(params[:book_id])
  # end

  # def update
  #  @order = Order.find(params[:id])
  #  book = Book.find(params[:book_id])

  #  if ((book.stock_quntity + order_params[:stock_quntity].to_i) >= order_params[:stock_quntity].to_i)
  #   if @order.update_columns({stock_quntity:order_params[:stock_quntity]})
  #     flash[:message] = "Order successfully placed"
  #     quantity = book.stock_quntity - order_params[:stock_quntity].to_i
  #     book.update_columns({stock_quntity:quantity})
  #     flash[:message] = "Order successfully placed!"
  #     redirect_to  :action=>"users_orders"

  #   else
  #     flash[:message] = "Somthing is wrong! Order is not place"
  #     redirect_to :action=>"new", status: :unprocesible_entity

  #   end
  # else
  #   flash[:message] = "Please enter a valid stock quantity!"

  #   redirect_to :action=>"edit"


  # end
# end
def destroy
  @order = Order.find(params[:id])

  if @order.destroy
   book = Book.find(params[:book_id])
   quantity = book.stock_quntity + @order.stock_quntity
   book.update_columns({stock_quntity:quantity})
   flash[:message] = "Order successfully cancel"
   redirect_to :action=>"users_orders"
 else
   flash[:message] = "Somthing is wrong! Order is not cancel"
   redirect_to :action=>"users_orders", status: :unprocesible_entity
 end
end

# def show
#   @order = current_account.orders

# end


def users_orders
  if current_account.type == "Admin"
    @user = User.find(params[:book_id])
  else
    @user = User.find(current_account.id)
  end
  @order = @user.orders
  

end

def order_params
  params.require(:order).permit(:stock_quntity)
end
end
