// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import "bootstrap"
import $ from 'jquery'
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

//needed to be able to do jQuery in erb.js files
global.$ = jQuery;

// setTimeout function to close alert messages
$(document).ready(function() {
  setTimeout(function() {
    $(".alert").alert('close');
}, 4000);

});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

$(document).ready(()=>{
  //start count of additional item will 2
  let ingredientCount = 2
  let addBtn = document.querySelector("#addBtn")
  let addIngredient = 
    `<div class="ingredient">
      <div class="name">
        <div class="field">
          <label for="_name">Name</label>
          <br>
          <input autofocus="autofocus" type="text" name="/[ingredient_name${ingredientCount}]" id="_ingredient_name${ingredientCount}">
        </div>
      </div>
      <div class="measurement">
        <div class="field">
          <label for="_measurement">Measurement</label>
          <br>
          <input autofocus="autofocus" type="text" name="/[ingredient_measurement1]" id="_ingredient_measurement1">
        </div>
      </div>
    </div>`
  
  addBtn.addEventListener('click', function(){
    document.querySelector(".ingredient-container").innerHTML+=addIngredient
    ingredientCount++
    console.log(`counter ${ingredientCount}`)
  })
})