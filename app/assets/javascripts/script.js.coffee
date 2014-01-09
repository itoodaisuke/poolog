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

  $('.place').click ->
    $('#myModal').modal()
    $('.nav-tabs li:first-child a').tab('show')
