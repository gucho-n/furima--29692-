const pay = ()=> {
  
  Payjp.setPublicKey("pk_test_34ee4f1eb9a1f2714015d62d"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form"); //change formは、カリキュラム名
  form.addEventListener("submit", (e) => {
   
    // 要素.addEventListener('イベント名', 関数)なので、submit tag を押すと eにさらに処理を記載していく
    e.preventDefault(); //値が入る前にトークン送信の先走りを防ぐ
    const formResult = document.getElementById("charge-form");
    //①htmlからこのchange formのデータを引っ張ってくるで(form_withを確認したら、idはchange_formでした。)
    const formData = new FormData(formResult);
    const card = {
      number: formData.get("user_order[number]"),
      cvc: formData.get("user_order[cvc]"),
      exp_month: formData.get("user_order[exp_month]"),
      exp_year: `20${formData.get("user_order[exp_year]")}`, 
    };

    //②引っ張ってきたデータでクラスを生成する
    // ③ここのデータをformDataに代入

    //string型でいいの？

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("card-number");
      document.getElementById("card-cvc").removeAttribute("card-cvc");
      document.getElementById("card-exp-month").removeAttribute("card-exp-month");
      document.getElementById("card-exp-year").removeAttribute("card-exp-year");

      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    })
  })
}

window.addEventListener("load", pay);
// 発火用

// 検証するときは自分の開いているアプリケーショん確認する