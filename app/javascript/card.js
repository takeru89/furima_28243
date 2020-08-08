const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("address_dealing[number]"),
      cvc: formData.get("address_dealing[cvc]"),
      exp_month: formData.get("address_dealing[exp_month]"),
      exp_year: `20${formData.get("address_dealing[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("address_dealing_number").removeAttribute("name");
        document.getElementById("address_dealing_cvc").removeAttribute("name");
        document.getElementById("address_dealing_exp_month").removeAttribute("name");
        document.getElementById("address_dealing_exp_year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
        console.log(response)
      }
    });
  });
};

window.addEventListener("load", pay);