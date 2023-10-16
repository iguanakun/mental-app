function dropdown (pullDownButton, pullDownParents){
  pullDownButton.addEventListener('mouseout', function(){
      pullDownButton.removeAttribute("style")
    })

    pullDownButton.addEventListener('click', function(e) {
      // プルダウメニューの表示と非表示の設定
      if (pullDownParents.style.display == 'block') {
          pullDownParents.style.display = 'none';
      } else {
          pullDownParents.style.display = 'block';
      }
      
      // クリックがプルダウンボタン内で伝播しないようにする
      e.stopPropagation();
    });

    // ドキュメント全体にクリックイベントハンドラを追加
    document.addEventListener('click', function() {
        // プルダウンメニューを非表示にする
        pullDownParents.style.display = 'none';
    });

    // プルダウンメニュー内のクリックがドキュメント全体に伝播しないようにする
    pullDownParents.addEventListener('click', function(e) {
        e.stopPropagation();
    });
};

function navbar (){
  /****************************
    エクササイズメニューの開閉
  *****************************/
  const pullDownButton = document.getElementById("navbar-items")
  const pullDownParents = document.getElementById("navbar-pulldown");
  
  pullDownButton.addEventListener('mouseover', function(){
    pullDownButton.setAttribute("style", "background-color:#96dc78;")
  })

  dropdown (pullDownButton, pullDownParents);

  /****************************
    メモ一覧メニューの開閉
  *****************************/
  const pullDownButton02 = document.getElementById("navbar-items02")
  const pullDownParents02 = document.getElementById("navbar-pulldown02");
  
  pullDownButton02.addEventListener('mouseover', function(){
    pullDownButton02.setAttribute("style", "background-color:#e5e5e5;")
  })

  dropdown (pullDownButton02, pullDownParents02);
  
};
 
window.addEventListener('turbo:load', navbar);