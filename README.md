# Beatstep-for-Davinci-resolve-Win
This project is for MIDI Translator Pro combined with Beatstep, in order to manipulate Davinci resolve on PC.

You need [BOME MIDI Translator Pro](https://www.bome.com/products/miditranslator) in order to run this project 

Inspired by 

https://controller-one.nl/the-project/

https://posttools.tachyon-consulting.com/davinci-resolve-controllers/beatstep-resolve-edition/?v=1c2903397d88

Knob to mouse is based on Stefbert's project and SteveC's instrunction.

https://forum.bome.com/t/davinci-resolve-with-arturia-beatstep/3096/17



Q&A

Q: Can I stick with a midi controller without buying a panel?

A: Technically yes but not recommended. It was meant to be an alternative to the Mini panel, I would say it works better with a Micro panel. Part of the reason we use panel is for muscle memory, MIDI controller is just a temporary alternative solution, if you are gonna pursuit color grading as a career you would eventually buy a real panel. 

Q: Will there be a 4K or 1080p version

A: 4K maybe, I don't have a 1080p screen right now, but there will be an instruction about change resolution.

Q: Will there be a paid version or consultant

A: No, this whole project is based on other people's job, and I'm really not good at coding, If you have problem or need some new feature feel free to post in Issues tab. I may not resolve every issue since it's just a part time project.

Q: How can I contribute to this project

A: Test it, come up with a better structure, add function by yourself, everything is welcomed.

If this project helped you and you have spare money feel free to buy me a coffee.

<div id="smart-button-container">     <div style="text-align: center"><label for="description">Thanks for your contribution! </label><input type="text" name="descriptionInput" id="description" maxlength="127" value=""></div>       <p id="descriptionError" style="visibility: hidden; color:red; text-align: center;">Please enter a description</p>     <div style="text-align: center"><label for="amount"> </label><input name="amountInput" type="number" id="amount" value="" ><span> USD</span></div>       <p id="priceLabelError" style="visibility: hidden; color:red; text-align: center;">Please enter a price</p>     <div id="invoiceidDiv" style="text-align: center; display: none;"><label for="invoiceid"> </label><input name="invoiceid" maxlength="127" type="text" id="invoiceid" value="" ></div>       <p id="invoiceidError" style="visibility: hidden; color:red; text-align: center;">Please enter an Invoice ID</p>     <div style="text-align: center; margin-top: 0.625rem;" id="paypal-button-container"></div>   </div>   <script src="https://www.paypal.com/sdk/js?client-id=sb&enable-funding=venmo&currency=USD" data-sdk-integration-source="button-factory"></script>   <script>   function initPayPalButton() {     var description = document.querySelector('#smart-button-container #description');     var amount = document.querySelector('#smart-button-container #amount');     var descriptionError = document.querySelector('#smart-button-container #descriptionError');     var priceError = document.querySelector('#smart-button-container #priceLabelError');     var invoiceid = document.querySelector('#smart-button-container #invoiceid');     var invoiceidError = document.querySelector('#smart-button-container #invoiceidError');     var invoiceidDiv = document.querySelector('#smart-button-container #invoiceidDiv');      var elArr = [description, amount];      if (invoiceidDiv.firstChild.innerHTML.length > 1) {       invoiceidDiv.style.display = "block";     }      var purchase_units = [];     purchase_units[0] = {};     purchase_units[0].amount = {};      function validate(event) {       return event.value.length > 0;     }      paypal.Buttons({       style: {         color: 'gold',         shape: 'rect',         label: 'paypal',         layout: 'vertical',                },        onInit: function (data, actions) {         actions.disable();          if(invoiceidDiv.style.display === "block") {           elArr.push(invoiceid);         }          elArr.forEach(function (item) {           item.addEventListener('keyup', function (event) {             var result = elArr.every(validate);             if (result) {               actions.enable();             } else {               actions.disable();             }           });         });       },        onClick: function () {         if (description.value.length < 1) {           descriptionError.style.visibility = "visible";         } else {           descriptionError.style.visibility = "hidden";         }          if (amount.value.length < 1) {           priceError.style.visibility = "visible";         } else {           priceError.style.visibility = "hidden";         }          if (invoiceid.value.length < 1 && invoiceidDiv.style.display === "block") {           invoiceidError.style.visibility = "visible";         } else {           invoiceidError.style.visibility = "hidden";         }          purchase_units[0].description = description.value;         purchase_units[0].amount.value = amount.value;          if(invoiceid.value !== '') {           purchase_units[0].invoice_id = invoiceid.value;         }       },        createOrder: function (data, actions) {         return actions.order.create({           purchase_units: purchase_units,         });       },        onApprove: function (data, actions) {         return actions.order.capture().then(function (details) {           alert('Transaction completed by ' + details.payer.name.given_name + '!');         });       },        onError: function (err) {         console.log(err);       }     }).render('#paypal-button-container');   }   initPayPalButton();   </script>

