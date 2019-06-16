class ToppagesController < ApplicationController
  def index
    if logged_in?
     @post=current_user.posts.build
    end
  end
end
