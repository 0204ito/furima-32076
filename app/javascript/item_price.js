window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");//金額に関する要素の取得（ビュー内のid指定）priceInputに代入
  priceInput.addEventListener("input", () => {   //入力するとイベント発火
  const inputValue = priceInput.value;         //value属性で入力した値を取得
  console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");//手数料に関する要素を取得。addTaxDomに代入
    addTaxDom.innerHTML = (Math.floor (inputValue * 0.1))//innerHTMLで、HTML要素の書き換えを行う（入力した金額をもとに販売手数料を計算する処理）
    console.log(addTaxDom);

      const addTaxUp = document.getElementById("profit");//販売利益に関する要素を取得。addTaxUpに代入
      const tax = inputValue * 0.1//value属性は入力した値に対してしか使えないので、もう一度変数を定義して消費税いを計算する
      addTaxUp.innerHTML = (Math.floor (inputValue - tax))//innerHTMLで、HTML要素の書き換えを行う（入力した金額から販売手数料を引き、利益を計算する処理）
      console.log(addTaxUp);
  })

})
