class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :set_place_histories, only: [:new, :edit]
  before_action :set_member_histories, only: [:new, :edit]

  # GET /games
  # GET /games.json
  def index
    @games = Game.order(created_at: :desc).page params[:page]
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
    @game.game_records.build
    @game.build_party

    p @place_histories
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    for i in 0..1 do
      user_data = user_params[:game_records_attributes]["#{i}"]
      User.find_or_create(user_data)
    end

    @game = Game.new(game_params)
    @game.party = Party.where(user_id: current_user.id).where(date: party_params[:date]).first || @game.build_party(party_params)
    @game.party.place = Place.where(foursquare_id: place_params[:foursquare_id]).first || @game.party.build_place(place_params)

    # redirect_to new_game_path
    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render action: 'show', status: :created, location: @game }
      else
        format.html { render action: 'new' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    for i in 0..1 do
      user_data = user_params[:game_records_attributes]["#{i}"]
      User.find_or_create(user_data)
    end

    @game.party = Party.where(user_id: current_user.id).where(date: party_params[:date]).first || @game.build_party(party_params)
    @game.party.id = nil if @game.party.new_record?
    @game.party.place = Place.where(foursquare_id: place_params[:foursquare_id]).first || @game.party.build_place(place_params)

    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  def search_venues
    foursquare ||= Foursquare2::Client.new(client_id: ENV['FOURSQUARE_KEY'], client_secret: ENV['FOURSQUARE_SECRET'])
    if params[:keyword]
      venues = foursquare.search_venues(categoryId: ENV['FOURSQUARE_POOLHALL_ID'], intent: 'browse', near: params[:keyword], radius: 1500)
    elsif params[:latitude] && params[:longitude]
      venues = foursquare.search_venues(categoryId: ENV['FOURSQUARE_POOLHALL_ID'], intent: 'browse', ll: "#{params[:latitude]},#{params[:longitude]}", radius: 1500)
    end
    render json: venues.to_json || nil
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:rule, :video_id, game_records_attributes: [:id, :user_id, :winner])
    end

    def party_params
      params.require(:game).require(:party_attributes).permit(:id, :date, :user_id)
    end

    def place_params
      params.require(:game).require(:party_attributes).require(:place).permit(:foursquare_id, :name)
    end

    def user_params
      params.require(:game).permit(game_records_attributes: [:user_id, :user_name, :winner])
    end

    def set_place_histories
      @place_histories = current_user.parties.map{|party| party.place}.uniq[0..9]
    end

    def set_member_histories
      @member_histories = current_user.games.map{|game| game.opponent(current_user)}.uniq[0..9]
    end
end
