class CommentController < ApplicationController

  def add
    new_comment = Comment.new

    new_comment.photo_id = params.fetch("addcomment_photoid").to_i
    new_comment.author_id = params.fetch("addcomment_authorid").to_i
    new_comment.body = params.fetch("addcomment_body")

    new_comment.save

    redirect_to("/photos/#{new_comment.photo_id}", {:notice => "Comment added successfully."})
  end

end
