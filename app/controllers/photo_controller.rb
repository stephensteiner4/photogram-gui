class PhotoController < ApplicationController
  def index
    @list_of_photos = Photo.all.order({:created_at => :desc})

    render({ :template => "/photo_templates/index" })
  end

  def details
    photo_id = params.fetch("path_id").to_i
    @photo_detail = Photo.where({:id => photo_id}).at(0)

    @comment_list = @photo_detail.comments

    render({:template => "/photo_templates/details"})
  end

  def create
    new_photo = Photo.new

    new_photo.image = params.fetch("add_src")
    new_photo.caption = params.fetch("add_caption")
    new_photo.owner_id = params.fetch("add_ownerid")

    new_photo.save

    redirect_to("/photos/#{new_photo.id}", {:notice => "Photo successfully created."})
  end

  def destroy
    photo_id = params.fetch("path_id").to_i

    @select_photo = Photo.where({:id => photo_id}).at(0)

    @select_photo.destroy

    redirect_to("/photos", {:notice => "Photo deleted successfully."})

  end

  def update
    photo_id = params.fetch("path_id").to_i
    @photo_update = Photo.where({:id => photo_id}).at(0)

    @photo_update.image = params.fetch("edit_src")
    @photo_update.caption = params.fetch("edit_caption")

    @photo_update.save

    redirect_to("/photos/#{@photo_update.id}", {:notice => "Photo updated successfully."})
  end


end
