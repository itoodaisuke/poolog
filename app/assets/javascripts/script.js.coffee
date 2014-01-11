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

  #Place Select
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


  #Member Select
  $('.member-form').click ->
    $('#member-select').modal()
    $('.nav-tabs li:first-child a').tab('show')
    i = $('.members').index($(this).parent('.members'))
    $('#member-select').attr('data-target-member', i)

  $('#member-select .modal-list li').click ->
    i = $('#member-select').attr('data-target-member')
    $('#game_game_records_attributes_'+i+'_user_id').val($(this).attr('data-user_id'))
    $('.members').eq(i).find('.member-form .form-group div').text($(this).text())
    $('#member-select').modal('hide')

  $('.search-box button').click (e) ->
    keyword = $('.search-box input').val()
#    $.ajax
#      url: ""
#      format: 'json'
#      method: "GET"
#      data:
#        keyword: 'hoge'
#      success: (data) ->
#        alert("success")
#        console.log(data)
#      error: (data) ->
#        alert("errror")
    e.preventDefault()

  $('.winner-form').click ->
    i = $('.winner-form').index($(this))
    $('.game_game_records_winner input').val(0)
    $('#game_game_records_attributes_'+i+'_winner').val(1)

    $('.winner-form').removeClass('active')
    $(this).addClass('active')
