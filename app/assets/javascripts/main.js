$("span.menu").click(function(){
  $(".top-nav ul").slideToggle("slow" , function(){
  });
});

$(document).ready(function() {
  $("#owl-product").owlCarousel({
    autoPlay: 3000,
    autoPlay:true,
    items: 4,
    itemsDesktop: [640,5],
    itemsDesktopSmall: [414,4]
  });
});

$(function() {
  $("#banner-slider").responsiveSlides({
  auto: true,
  pager:true,
  nav:false,
  speed: 500,
  namespace: "callbacks"
  });
});

$(document).ready(function() {
  $("#data-list").DataTable( {
  });
});
