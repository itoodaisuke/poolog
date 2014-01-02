class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'static_layout'
  def home
  end
end
