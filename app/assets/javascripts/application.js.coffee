#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require jquery-ui
#= require tether
#= require bootstrap
#= require dataTables/jquery.dataTables
#= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
#= require dataTables/extras/dataTables.responsive
#= require unslider

jQuery ->
  $('.datatable').DataTable
    responsive: true,
    pagingType: 'simple'
    order:      [[ 0, "desc" ]]

  $('.main-slider').unslider
    autoplay: true
    infinite: true
    arrows: false
    nav: false
    delay: 6500

  $('.unslider').css('margin-top', '-60px')
