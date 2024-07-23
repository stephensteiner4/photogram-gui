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

  def update
    the_username = params.fetch("user")
    new_name = params.fetch("edit_username")

    @the_user = User.where({:username => the_username}).at(0)

    @the_user.username = new_name

    if @the_user.valid?
      @the_user.save

      redirect_to("/users/#{new_name}", {:notice => "Username updated successfully."})
    else
      redirect_to("/users/#{the_username}", {:alert => "Username unavailable, please try again."})
    end
  end
end
