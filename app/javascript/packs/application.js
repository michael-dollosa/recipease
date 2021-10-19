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

//adding ingredients
$(document).ready(()=>{
  //start count of additional item will 2
  let ingredientCount = 2
  let addBtn = document.querySelector("#addBtn")
  
  addBtn.addEventListener('click', function(){
    let newIngredient = document.createElement("div")
    newIngredient.classList.add("ingredient")
    newIngredient.innerHTML =
    `
      <div class="name">
        <div class="field">
          <label for="recipe_name">Name</label>
          <br>
          <input autofocus="autofocus" type="text" name="recipe[ingredient[name${ingredientCount}]]" id="recipe_ingredient_name${ingredientCount}">
        </div>
      </div>
      <div class="measurement">
        <div class="field">
          <label for="recipe_measurement">Measurement</label>
          <br>
          <input autofocus="autofocus" type="text" name="recipe[ingredient[measurement${ingredientCount}]]" id="recipe_ingredient_measurement${ingredientCount}">
        </div>
      </div>
    `

    document.querySelector(".ingredient-container").append(newIngredient)
    ingredientCount++
    console.log(`counter ${ingredientCount}`)
  })
})

//image url listener
$(document).ready(()=>{
  let inputListener = document.querySelector("#recipe_img_url")
  let imgHolder = document.querySelector("#imagePreview")
  inputListener.addEventListener('keyup', function(){
    console.log(inputListener.value)
    imgHolder.src = inputListener.value
  })
})