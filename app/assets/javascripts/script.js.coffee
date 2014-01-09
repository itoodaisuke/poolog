jQuery ->
  $('.navbar-header button.navbar-toggle')
    .attr('data-toggle', '')
    .attr('data-target', '')
    .sidr({
      source: '.navbar-collapse.collapse',
      renaming: false,
      onOpen: ->
        $('.navbar-fixed-top').css('position', 'absolute');
        $('.navbar-rightbutton').css('position', 'absolute');
        $('.navbar-header button.navbar-toggle').css('position', 'absolute');
      onClose: ->
        setTimeout ->
          $('.navbar-fixed-top').css('position', 'fixed');
          $('.navbar-header button.navbar-toggle').css('position', 'fixed');
          $('.navbar-rightbutton').css('position', 'fixed');
        , 150
  });

  $('.place-form').click ->
    $('#place-select').modal()
    $('.nav-tabs li:first-child a').tab('show')

  $('.nav-tabs li:last-child a').click ->
    unless navigator.geolocation then alert "Your browser can not support geolocation."
    success = (position) ->
      latitude  = position.coords.latitude
      longitude = position.coords.longitude
    error = ->
      alert "No position available."
    navigator.geolocation.getCurrentPosition(success, error)

  $('#place-select .modal-list li').click ->
    $('#game_party_attributes_place_foursquare_id').val($(this).attr('data-foursquare_id'))
    $('#game_party_attributes_place_name').val($(this).text())
    $('.place-form .form-group div').text($(this).text())
    $('#place-select').modal('hide')
