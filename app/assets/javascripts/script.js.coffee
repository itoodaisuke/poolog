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

  $('#place-search .search-box button').click (e) ->
    keyword = $('#place-search .search-box input').val()
    param =
      "keyword" : keyword
    search_venues(param)
    e.preventDefault()

  $('#place-search .location-search button').click (e) ->
    get_location().then(
      (position) ->
        param =
          "latitude"  : position.coords.latitude
          "longitude" : position.coords.longitude
        search_venues(param)
      (error) ->
        alert("Failed to get the current location.")
    )
    e.preventDefault()

  get_location = ->
    deferred = new jQuery.Deferred()
    unless navigator.geolocation then alert "Your browser can not support geolocation."
    navigator.geolocation.getCurrentPosition(
      (position) ->
        return deferred.resolve(position)
      (error) ->
        return deferred.reject(error)
    )
    return deferred.promise()

  search_venues = (param) ->
    $.ajax
      url: "/games/search_venues"
      format: 'json'
      method: "GET"
      data:
        param
      success: (data) ->
        if data
          $('#place-search .modal-list').empty()
          for i in data["groups"][0]["items"]
            $('#place-search .modal-list').append("<li data-foursquare_id="+i['id']+">"+i['name']+"</li>")
      error: (data) ->
        alert("errror")


  jQuery(document).on
    click: ->
      $('#game_party_attributes_place_foursquare_id').val($(this).attr('data-foursquare_id'))
      $('#game_party_attributes_place_name').val($(this).text())
      $('.place-form .form-group div').text($(this).text())
      $('#place-select').modal('hide')
    '#place-select .modal-list li'


  #Member Select
  $('.member-form').click ->
    $('#member-select').modal()
    $('.nav-tabs li:first-child a').tab('show')
    i = $('.members').index($(this).parent('.members'))
    $('#member-select').attr('data-target-member', i)

  jQuery(document).on
    click: ->
      i = $('#member-select').attr('data-target-member')
      $('#game_game_records_attributes_'+i+'_user_id').val($(this).attr('data-user_id'))
      $('.members').eq(i).find('.member-form .form-group div').text($(this).text())
      $('#member-select').modal('hide')
    '#member-select .modal-list li'

  $('#member-search .search-box button').click (e) ->
    keyword = $('#member-search .search-box input').val()
    $.ajax
      url: "/users/search_user"
      format: 'json'
      method: "GET"
      data:
        keyword: keyword
      success: (data) ->
        if data
          $('#member-search .modal-list').empty()
          for i in data
            $('#member-search .modal-list').append("<li data-user_id="+i['raw_attributes']['id']+"><img src='https://graph.facebook.com/"+i['raw_attributes']['id']+"/picture?width=45&height=45'>"+i['name']+"</li>")
      error: (data) ->
        alert("errror")
    e.preventDefault()

  $('.winner-form').click ->
    i = $('.winner-form').index($(this))
    $('.game_game_records_winner input').val(0)
    $('#game_game_records_attributes_'+i+'_winner').val(1)

    $('.winner-form').removeClass('active')
    $(this).addClass('active')
