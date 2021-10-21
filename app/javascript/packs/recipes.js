//adding ingredients
$(document).ready(()=>{
  //start count of additional item will 2
  let ingredientCount = document.querySelector(".ingredient-container").childElementCount
  let addBtn = document.querySelector("#addBtn")
  
  addBtn.addEventListener('click', function(){
    ingredientCount++
    let newIngredient = document.createElement("div")
    newIngredient.classList.add("ingredient")
    newIngredient.innerHTML =
    `
      <div class="name">
        <div class="field">
          <label for="recipe_name">Name</label>
          <br>
          <input autofocus="autofocus" type="text" name="recipe[ingredient_hash[ingredient${ingredientCount}[name]]]" id="recipe_ingredient_name${ingredientCount}">
        </div>
      </div>
      <div class="measurement">
        <div class="field">
          <label for="recipe_measurement">Measurement</label>
          <br>
          <input autofocus="autofocus" type="text" name="recipe[ingredient_hash[ingredient${ingredientCount}[measurement]]]" id="recipe_ingredient_measurement${ingredientCount}">
        </div>
      </div>
    `

    document.querySelector(".ingredient-container").append(newIngredient)
    console.log(`counter ${ingredientCount}`)
  })
})

//image url listener
$(document).ready(()=>{
  let inputListener = document.querySelector("#recipe_img_url")
  let imgHolder = document.querySelector("#imagePreview")
  inputListener.addEventListener('keyup', function(){
    console.log(inputListener.value)
    imgHolder.setAttribute("src", inputListener.value);
  })
})