const pay = () => {
  const submit = document.getElementById("button");
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("buyer_shipping[card_number]"),
      cvc: formData.get("buyer_shipping[cvc]"),
      exp_month: formData.get("buyer_shipping[month]"),
      exp_year: `20${formData.get("buyer_shipping[year]")}`,
    };
    console.log(card)
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
    
      document.getElementById("charge-form").submit();
    });
  
  });
};

window.addEventListener("load", pay);