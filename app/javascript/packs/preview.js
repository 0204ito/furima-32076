if (document.URL.match( /new/ )  || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');
    
    // 選択した画像を表示するための関数
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成③
    const imageElement = document.createElement('div');
    imageElement.setAttribute('class', "image-element")//生成したdiv要素にimage-elementというclass名を付与する
        let imageElementNum = document.querySelectorAll('.image-element').length//class名がimage-elementの要素が、ブラウザにいくつ存在するかの数字を、変数imageElementNumに格納する



    // 表示する画像を生成①
    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', blob);
    // 生成したHTMLの要素をブラウザに表示させる

    // ファイル選択ボタンを生成②
    const inputHTML = document.createElement('input')
    inputHTML.setAttribute('id', `item_image_${imageElementNum}`)
        inputHTML.setAttribute('name', 'item[images][]')
        inputHTML.setAttribute('type', 'file')
        //<input id="item_image_[番号]" name="item[images][]" type="file">を生成

      // 生成したHTMLの要素をブラウザに表示させる
        imageElement.appendChild(blobImage);//①
    imageElement.appendChild(inputHTML)//②
    ImageList.appendChild(imageElement);//③表示させるためのdiv
      //<div>
      //<img src="    blobにある画像のURL   ">
      //</div>

      document.getElementsByClassName('item-box-image').addEventListener('change', function(e){
        // 画像が表示されている場合のみ、すでに存在している画像を削除する
        const imageContent = document.querySelector('img');
        if (imageContent){
          imageContent.remove();
        }


      //２枚目以降のイベント発火
      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      })
    };
  })
}