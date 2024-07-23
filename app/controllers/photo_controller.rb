class PhotoController < ApplicationController
  def index
    @list_of_photos = Photo.all

    render({ :template => "/photo_templates/index" })
  end

  def details
    photo_id = params.fetch("path_id").to_i
    @photo_detail = Photo.where({:id => photo_id}).at(0)

    render({:template => "/photo_templates/details"})
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
