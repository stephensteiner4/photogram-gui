class CommentController < ApplicationController

  def add
    new_comment = Comment.new

    new_comment.photo_id = params.fetch("comment_photoid").to_i
    new_comment.author_id = params.fetch("enter_authorid").to_i
    new_comment.body = params.fetch("comment_body")

    new_comment.save

    redirect_to("/photos/#{new_comment.photo_id}", {:notice => "Comment added successfully."})
  end

end
