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
//= require rails-ujs
//= require activestorage
//= require jquery3
//= require jquery.jscroll.min.js
//= require popper
//= require bootstrap
//= require_tree .

//  いいねボタン・ステータスのマウスホバー
$(function() {
    $(document).on({
        'mouseenter': function(){
          $(this).find('.likes_button').fadeIn(200);
          $(this).find('.likes_status').fadeIn(200);
          $(this).find('.user_achivement-p').fadeIn(200);
        }
        ,
        'mouseleave': function(){
          $(this).find('.likes_button').fadeOut(200);
          $(this).find('.likes_status').fadeOut(200);
          $(this).find('.user_achivement-p').fadeOut(200);
        }
        
    },'.like-hover');
});

// 画像プレビュー機能
 $(function(){
   $('#post-image').change(function(e){
    // 投稿された画像ファイルのオブジェクト取得
      var file = e.target.files[0];
      var reader = new FileReader();
    // 画像ではない場合の処理
      if(file.type.indexOf("image") < 0) {
        alert("画像ファイルを選択してください")
        return false;
      }
    // アップロードした画像をプレビュー部分に上書き
      reader.onload = (function(e){
      $('#img-prev').attr('src', e.target.result);
      });
      reader.readAsDataURL(file);
 });
});

$(window).on('scroll', function() {
  scrollHeight = $(document).height();
  scrollPosition = $(window).height() + $(window).scrollTop();
  if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
        $('.jscroll').jscroll({
          contentSelector: '.jscroll',
          nextSelector: ".jscroll-next"
        });
  }
});

