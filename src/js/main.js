// SCROLL TOP BUTTON
mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function () {
  scrollFunction();
};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
mybutton.addEventListener("click", topFunction);

function topFunction() {
  scroll({
    top: 0,
    behavior: "smooth",
  });
}

// SMOOTH SCROLLING
const links = document.querySelectorAll(
  ".navbar .nav-item a , .navigation-links li a"
);

for (const link of links) {
  link.addEventListener("click", clickHandler);
}

function clickHandler(e) {
  e.preventDefault();
  const href = this.getAttribute("href");
  const offsetTop = document.querySelector(href).offsetTop;

  scroll({
    top: offsetTop - 60,
    behavior: "smooth",
  });
}


  // Init AOS
  function aos_init() {
    AOS.init({
      offset:120,
      duration: 700,
      once: true,
      easing: 'ease'
    });
  }
  $(window).on('load', function() {
    aos_init();
  });

// Auto play modal video
$(function() {
  
  $(".video").click(function () {
    var theModal = $(this).data("target"),
    videoSRC = $(this).attr("data-video"),
    videoSRCauto = videoSRC + "?modestbranding=1&rel=0&controls=0&showinfo=0&html5=1&autoplay=1";
    $(theModal + ' iframe').attr('src', videoSRCauto);
    $(theModal + ' button.close').click(function () {
      $(theModal + ' iframe').attr('src', videoSRC);
    });
  });
});
