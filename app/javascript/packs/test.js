
const add_review_button = document.getElementById("add_review_button");
const remove_review_button = document.getElementById("remove_review_button");
const form_section = document.getElementById("form_section");

add_review_button.addEventListener('click', function() {
    form_section.classList.remove("hide");
});

remove_review_button.addEventListener('click', function(){
    form_section.classList.add("hide");    
});