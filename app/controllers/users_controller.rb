class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @event = Event.find(params[:id])
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])

    if @user.update("first_name" => params[:first_name], "laste_name" =>  params[:last_name], "description" =>  params[:description],  "email" =>  params[:email])
      redirect_to @user
    else
      render :edit
    end
  end

end
