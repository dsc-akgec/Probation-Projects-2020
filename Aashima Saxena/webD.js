// $(".card").hover(
//   function(){
//
//     $(".teamimgbody").removeClass("card-img-overlay");
//     $(".teamimgbody").addClass("card-body");
//     // $(".card-img").addClass("teamimg");
//     $(".card").addClass("teamcard");
//
//   },function(){
//     $(".teamimgbody").removeClass("card-body");
//     $(".teamimgbody").addClass("card-img-overlay");
//     // $(".card-img").removeClass("teamimg");
//     $(".card").removeClass("teamcard");
//
//   }
// );
// $(".teammembers").hover(
//   function(){
//
//     $(".main").addClass("mainhover");
//   },function(){
//     $(".main").removeClass("mainhover");
//   }
// );
// $(document).ready(
//   function(){
//     var scrollLink = $.(".nav-link");
//     scrollLink.click(function(e){
//     e.preventDefault();
//     $('body,html').animate({
//       scrollTop: $(this.hash).offset().top
//     }, 5000);
//   });
//
// });

// navigation scroll
$(window).on('scroll', function() {
  if ($(window).scrollTop()) {
    $('nav').addClass('shadowNav');
  } else {
    $('nav').removeClass('shadowNav');
  }
})
// aos animation activation
AOS.init();

//for making the button blink
$.fn.blink = function() {
  return this.each(function() {
    var obj = $(this);
    setInterval(function() {
      if ($(obj).css("visibility") == "visible") {
        $(obj).css('visibility', 'hidden');
      } else if ($(obj).hover == true) {
        $(obj).css('visibility', 'visible');
      } else {
        $(obj).css('visibility', 'visible');
      }
    }, 500);
  });
}

$(document).ready(function() {
  $('.blink').blink();
});

// $(window).resize(function() {
//    /*If browser resized, check width again */
//    if ($(window).width() < 514) {
//     $('html').addClass('mobile');
//    }
//    else {$('html').removeClass('mobile');}
// });
// function blink_text() {
//     $('.register-btn').fadeOut(500);
//     $('.register-btn').fadeIn(500);
// }
// setInterval(blink_text, 1000);
