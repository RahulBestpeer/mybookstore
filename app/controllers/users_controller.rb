class UsersController < ApplicationController
  load_and_authorize_resource only: %i[index destroy]

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:message] = 'user Successfully deleted! '
      redirect_to action: 'index'
    else
      flash[:message] = 'Somthing is wrong! User is not deleted '
      redirect_to action: 'index', status: :unprocessable_entity
    end
  end
end
