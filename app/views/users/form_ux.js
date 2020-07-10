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