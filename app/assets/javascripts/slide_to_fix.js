$(document).ready( function() {
  // Calculate the height of the hero
  var headerHeight = $('#hero').outerHeight();
  var nav = $('#nav');
  var navHeight = nav.outerHeight();

  var isDesktop = typeof window.orientation === 'undefined';
  if (isDesktop) {
    // Add body hook for device specific styles
    $('body').addClass('desktop');
    // Only use sticky navigation for desktop
    $(window).scroll( function() {
      stickyNav(headerHeight, nav, navHeight);
    });
  } else {
    $('body').addClass('device ');
  }

  // Set up scroll to navigation
  $('#nav li a.scroll').on('click', scrollTo);

});

function scrollTo(event) {
  event.preventDefault();

  var link = $(this).attr('href');
  
  if (typeof window.orientation === 'undefined') {
    $('html, body').animate({
      scrollTop: $(link).offset().top - $('#nav').outerHeight()
    }, 500);
  } else {
    $('html, body').animate({
      scrollTop: $(link).offset().top
    }, 500);
  }
}


function stickyNav(headerHeight, nav, navHeight) {
  //if scrolled down more than the hero's height
  if ($(window).scrollTop() >= headerHeight){
    // fix the nav to the top of the viewport
    nav.addClass('fixed');
    $('section.welcome-message').css('marginTop', 60);
  } else {
    // when scroll up or less than aboveHeight
    nav.removeClass('fixed');
    $('section.welcome-message').css('marginTop', 0);
  }
}
