class BooksController < ApplicationController
  load_and_authorize_resource

  def index
    @books = Book.all.order('id desc')
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash.now[:message] = 'book created successfully!'
      redirect_to action: 'index'
    else
      flash.now[:message] = 'somthing is wrong book is not create'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash.now[:message] = 'book Updated successfully!'
      redirect_to action: 'index'
    else
      flash.now[:message] = 'somthing is wrong book is not update'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash.now[:message] = 'book Deleted successfully!'
      redirect_to action: 'index'
    else
      flash.now[:message] = 'somthing is wrong book is not Delete'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :price, :stock_quntity, :description, :image, :author_id)
  end
end
