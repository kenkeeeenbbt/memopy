// スクロール時にページタイトルを固定するためのコード
$(function() {
  var $win = $(window),
      $main = $('main'),
      $aside = $('aside'),
      navHeight = $aside.outerHeight(),
      navPos = $aside.offset().top,
      fixedClass = 'is-fixed';
  $win.on('load scroll', function() {
    var value = $(this).scrollTop();
    if ( value > navPos ) {
      $aside.addClass(fixedClass);
      $main.css('margin-top', navHeight);
    } else {
      $aside.removeClass(fixedClass);
      $main.css('margin-top', '0');
    }
  });
});