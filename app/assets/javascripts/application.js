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
//= require turbolinks
//= require_tree .

//新規登録・ログイン・人物追加画面=============================
//【開始】プレースホルダー風の文字のアニメーション=======================
var inputs = document.querySelectorAll('.field input')
for (var i = 0, len = inputs.length; i < len; i++) {
  var input = inputs.item(i)
  input.addEventListener('click', (e) => {
    var target = e.target
    var label = target.previousElementSibling
    target.classList.add('focus')
    label.classList.add('move', 'focus')
  })
  input.addEventListener('blur', (e) => {
    var target = e.target
    var label = target.previousElementSibling
    if (target.value.length === 0) {
      label.classList.remove('move')
    }
    target.classList.remove('focus')
    label.classList.remove('focus')
  })
}
//【終了】プレースホルダー風の文字のアニメーション=======================