class AuthorsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @authors = Author.all.order("id desc")
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      flash.now[:message] = "author is successfully created!"
      redirect_to :action=>"index"
    else
      flash.now[:message] = "Somthing is wrong! author is not create"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    
    @author = Author.find(params[:id])

    if @author.update(author_params)
      flash.now[:message] = "author is successfully updated!"
      redirect_to :action=>"index"
    else
      flash.now[:message] = "Somthing is wrong! author is not update"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy 
    @author = Author.find(params[:id])

    if @author.destroy
      flash.now[:message] = "author is successfully deleted!"
      redirect_to :action=>"index"
    else
      flash.now[:message] = "Somthing is wrong! author is not delete"
      render :action=>"index", status: :unprocessable_entity
    end
  end

  def author_params
    params.require(:author).permit(:name, :dob)
  end
end
