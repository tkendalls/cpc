#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require jquery-ui
#= require bootstrap-sprockets
#= require dataTables/jquery.dataTables
#= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
#= require dataTables/extras/dataTables.responsive
#= require tether
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
