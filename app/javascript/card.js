// payと言う関数を定義します
const pay = () => {
  // PAIJP公開鍵(Public_Key)生成コード
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵
  // id = charge-form内のsubmitが実行されるとイベントが発火します
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
   // preventDefault();メソッドを用いて、Railsのフォーム送信処理をキャンセルします
   // Railsのフォーム送信からサーバーサイドに値を送るのではなく、JavaScriptでサーバーサイドに値を送るため
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    // 入力された、カードの情報を変数cardに代入します。
    const card = {
      number: formData.get("purchase_address[number]"),
      cvc: formData.get("purchase_address[cvc]"),
      exp_month: formData.get("purchase_address[exp_month]"),
      exp_year: `20${formData.get("purchase_address[exp_year]")}`,
    };
    console.log(card)
    // トークン生成コード
    Payjp.createToken(card, (status, response) => {
      console.log(response)
      // 変数に代入された情報が正常であれば、28行目で生成されたトークンを変数に代入します。
      if (status === 200) {
        const token = response.id;
        // 生成する要素を取得
        const renderDom = document.getElementById("charge-form");
        // 生成するHTMLを定義します
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        // formの最後に生成する処理を行っています。
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        // 入力された各カード情報をパラメーターとして送られないように、値を削除(remove)しています
        document.getElementById("purchase_address_number").removeAttribute("name");
        document.getElementById("purchase_address_cvc").removeAttribute("name");
        document.getElementById("purchase_address_exp_month").removeAttribute("name");
        document.getElementById("purchase_address_exp_year").removeAttribute("name");

        // フォームに記載されている情報を、サーバーサイドへ送信します
        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      }
      // 変数に代入された情報が正常で無い場合
      else {
        charge-form.disabled = false;
        alert('「必須」項目箇所を正しく入力して下さい');
      }
    });
  });
};

// ページがロードされるとpayという関数が呼び出されます
window.addEventListener("load", pay);