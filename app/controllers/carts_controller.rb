class CartsController < ApplicationController
  load_and_authorize_resource only: %i[create destroy]

  def create
    if !Cart.find_by(book_id: params[:book_id]).nil?
      flash[:message] = 'book already added to your cart'
      redirect_to controller: 'books', action: 'index'
    else
      cart = current_account.carts.new(book_id: params[:book_id])
      if cart.save
        flash[:message] = 'book successfully added to your cart'
        redirect_to controller: 'books', action: 'index'
      else
        flash[:message] = 'Somthing is wrong! book is not add to your cart'
        redirect_to controller: 'books', action: 'index'
      end
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    if @cart.destroy
      flash[:message] = 'book successfully removed to your carts'
      redirect_to controller: 'books', action: 'index'
    else
      flash[:message] = 'Somthing is wrong book is not remove to your carts'
      redirect_to controller: 'books', action: 'index'
    end
  end
end
