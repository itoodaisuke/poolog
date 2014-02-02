# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  if $("#game_party_attributes_place_foursquare_id").val()
    $("#party").removeClass('in')
