class PartiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_party, only: [:show]

  def show
    @rankings = @party.rankings
  end

  private
    def set_party
      @party = Party.find(params[:id])
    end
end
