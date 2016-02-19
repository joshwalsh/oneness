// import carousel from "carousel";

vex.defaultOptions.className = 'vex-theme-plain';

$(document).ready(function(){
  var menuStatus = false;
  var isAnimating = false;

  $('.menu-trigger').on('click touchstart',function (e) {
    $(this).toggleClass('trigger-active');
    $('.menu-screen').toggleClass('is-present');

    if (menuStatus != true) {
      $('.nav').addClass('is-visible');
      menuStatus = true;
      return false;
    } else {
      $('.nav').removeClass('is-visible');
      menuStatus = false;
      return false;
    }

    e.preventDefault();
  });
});


// checker board styling on monthly calendar
$(document).ready(function() {
  $('#month-grid tr').addClass('month-row');
  $('.month-row .days:odd').addClass('days__gray');
  $('.month-row .days:even').addClass('days__white');
});

// toggle calendar views
$(document).ready(function() {
  $('.week-trigger').on('click touchstart',function (e) {
    $('.week-headline').addClass('is-visible');
    $('.month-headline').removeClass('is-visible');
    $('.week-trigger').addClass('is-active');
    $('.month-trigger').removeClass('is-active');
    $('.week-data').addClass('is-visible');
    $('.month-data').removeClass('is-visible');
    $('.week-specifics').addClass('is-visible');
  });

  $('.month-trigger').on('click touchstart',function (e) {
    $('.month-headline').addClass('is-visible');
    $('.week-headline').removeClass('is-visible');
    $('.month-trigger').addClass('is-active');
    $('.week-trigger').removeClass('is-active');
    $('.month-data').addClass('is-visible');
    $('.week-data').removeClass('is-visible');
    $('.week-specifics').removeClass('is-visible');
  });
});

// filter calendar by location
$(document).ready(function() {
  $('.location').on('click touchstart',function (e) {
    var locationClass = $(this).attr('id');
    if(locationClass == "location-all") {
      $('.week-event').removeClass('location-hidden');
      $('.month-event').removeClass('location-hidden');
      $('.location').removeClass('is-active');
      $(this).addClass('is-active');
    } else {
      $('.week-event').addClass('location-hidden');
      $('.month-event').addClass('location-hidden');
      $('.'+locationClass).removeClass('location-hidden');
      $('.location').removeClass('is-active');
      $(this).addClass('is-active');
    }
  });
});

// filter calendar by event category
$(document).ready(function() {
  $('.event-type-checkbox').change(function() {
    var typeClass = $(this).attr('id');
    if($(this).is(':checked')) {
      if($('*').hasClass('type-hidden')) {
        $('.'+typeClass).removeClass('type-hidden');
      } else {
        $('.week-event').addClass('type-hidden');
        $('.month-event').addClass('type-hidden');
        $('.'+typeClass).removeClass('type-hidden');
      };
    } else {
      if($('*').is(':checked')) {
        $('.'+typeClass).addClass('type-hidden');
      } else {
        $('.week-event').removeClass('type-hidden');
        $('.month-event').removeClass('type-hidden');
      };
    };
  });
});

// clear event category filters
$(document).ready(function() {
  $('#clear-type-filters').on('click touchstart', function(e) {
    $('*').removeClass('type-hidden');
    $('.event-type-checkbox').prop('checked', false);
  });
});

// checker board styling on support blocks
$(document).ready(function() {
  $('#support-grid .entry__blocks').addClass('support-row');
  $('.support-row:odd .support-blocks:odd').addClass('support-blocks--teal');
  $('.support-row:odd .support-blocks:even').addClass('support-blocks--blue');
  $('.support-row:even .support-blocks:even').addClass('support-blocks--teal');
  $('.support-row:even .support-blocks:odd').addClass('support-blocks--blue');
});

$('#featuredVideo').on('click', function(e) {
  e.preventDefault();
  var $trigger = $(this);
  vex.open({
    content: $('#featuredVideoCode').html()
  });
});

$('#monthpicker').datetimepicker({
  timepicker:false,
  format:'m/d/Y',
  onChangeDateTime:function(dp,$input){
    var dateSelected = new Date($input.val());
    var day = dateSelected.getDay(),
        diff = dateSelected.getDate() - day + (day == 0 ? -6:1);
    var monday = new Date(dateSelected.setDate(diff));

    window.location.href = "/calendar?date=" + (monday.getMonth() + 1) + "/" + monday.getDate() + "/" + monday.getFullYear();
  }
});

jQuery('#monthpickertrigger').click(function(){
  jQuery('#monthpicker').datetimepicker('show');
});
