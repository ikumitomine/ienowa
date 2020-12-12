// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require chartkick
//= require Chart.bundle
//= require select2


document.addEventListener("turbolinks:load"
, function () {

$(function(){
  $(window).scroll(function (){
    $('.fadein').each(function(){
      var elemPos = $(this).offset().top;
      var scroll = $(window).scrollTop();
      var windowHeight = $(window).height();
      if (scroll > elemPos - windowHeight + 200){
        $(this).addClass('scrollin');
      }
    });
  });
});


$(function() {
　$('.Toggle').click(function() {
    $(this).toggleClass('active');
  $('.menu').toggleClass('open');
  });
});

$(function() {
  　$('.top-Toggle').click(function() {
    $(this).toggleClass('active');
    $('.top-menu').toggleClass('open');
  });
  });

$(function() {
  $('.js-searchable').select2({
    width: 250,
    allowClear: true
  });
});

})