class UsersController < ApplicationController
  def index
    @list_of_users = User.all.order({:username => :asc})

    render({ :template => "/user_templates/index" })
  end

  def details
    username = params.fetch("user").to_s

    @user_info = User.where({:username => username}).at(0)

    @photo_list = Photo.all.where({:owner_id => @user_info.id})

    render({ :template => "/user_templates/details" })
  end
  
  def create
    @new_user = User.new

    @new_username = params.fetch("new_user")

    @new_user.username = @new_username

    if @new_user.valid?
      @new_user.save

      redirect_to("/users/#{@new_user.username}", {:notice => "Username created successfully!"})
    else
      redirect_to("/users", {:alert => "Username invalid, please try again."})
    end

  end

  def update
    the_username = params.fetch("user_id")
    new_name = params.fetch("new_username")

    @the_user = User.where({:id => the_username}).at(0)

    @the_user.username = new_name

    if @the_user.valid?
      @the_user.save

      redirect_to("/users/#{new_name}", {:notice => "Username updated successfully."})
    else
      redirect_to("/users/#{the_username}", {:alert => "Username unavailable, please try again."})
    end
  end
end
