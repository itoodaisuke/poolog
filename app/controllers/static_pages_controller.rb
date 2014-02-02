class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'static_layout'
  def home
    redirect_to parties_path if current_user
  end
end
