class UsersController < ApplicationController
  def index
    @list_of_users = User.all.order({:username => :asc})

    render({ :template => "/user_templates/index" })
  end

  def details
    username = params.fetch("user").to_s

    @user_info = User.where({:username => username}).at(0)

    render({ :template => "/user_templates/details" })
  end
end
