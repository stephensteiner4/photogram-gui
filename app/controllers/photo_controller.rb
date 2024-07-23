class PhotoController < ApplicationController
  def index
    @list_of_photos = Photo.all

    render({ :template => "/photo_templates/index" })
  end


end
