// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .
//= require jquery/jquery.sticky
//= require ckeditor/init
//= require jquery.bxslider
//= require bxslider/jquery.bxslider
//= require bxslider/jquery.bxslider.min.js
//= require fileuploader

window.App ={}
var sliderLink;
$(document).ready(function(){
  // 新增文章分類的post
  $('.slider-link-btn').click(function(){
    sliderLink = $(this).siblings();
    title = sliderLink[1].value;
    url = sliderLink[2].value;
    type = sliderLink[3].value;
    $.ajax({
      type: 'POST',
      url: '/admin/assets/slider_link',
      data: {"link": {"title": title, "url": url, "link_type":type} }
    });
  });
  // 新增文章分類的post
  $('#new-category').click(function(){
    $('#new-category-form').show();
    $('#cancel').show();
    $('#new-category').hide();
    // title = $('input[name="category[title]"').val();
    // $('#submit').click(function(){
    //   $.ajax({
    //     type: 'POST',
    //     url: $(this).parent().attr('action'),
    //     data: {"category": {"title": title}},
    //   }).done(function(){
    //     $.ajax({
    //       type: 'GET',
    //       url: '/admin/articles/categories',
    //       data: {},
    //     }).done(function(categories){
    //       categories_count = Object.keys(categories).length
    //       for(i = 0, i < categories_count,i++){
    //         categories["title"]
    //       }
    //     })
    //   })
    // })
  })
  $('#cancel').click(function(){
    $('#new-category-form').hide();
    $('#cancel').hide();
    $('#new-category').show();
  })
});


