include ApplicationHelper

module GameAttributesMacros
  def set_game_attributes(user, opponent)
    @place = attributes_for(:place)
    @party = attributes_for(:party, user_id: user.id, place: @place)
    @invalid_party = attributes_for(:party, user_id: nil, place: @place)
    @game_records =  {
      "0" => attributes_for(:game_record_for_controller, user_id: user.id),
      "1" => attributes_for(:game_record_for_controller, user_id: opponent.id)
    }
  end

  def set_update_game_attributes(user, opponent, game)
    @place = attributes_for(:place)
    @party = attributes_for(:party, user_id: user.id, place: @place)
    @game_records =  {
      "0" => attributes_for(:game_record_for_controller, id: game.game_records.first.id, user_id: user.id, game: game),
      "1" => attributes_for(:win_record_for_controller, id: game.game_records.last.id, user_id: opponent.id, game: game)
    }
  end
end
