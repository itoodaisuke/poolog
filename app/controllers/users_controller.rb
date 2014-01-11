class UsersController < ApplicationController
  def search_user
    result = FbGraph::User.search(params[:keyword], access_token: ENV['FACEBOOK_TOKEN'], limit: 15) unless params[:keyword].blank?
    render json: result || nil
  end
end
