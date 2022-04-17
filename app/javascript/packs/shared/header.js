const min_menu_title_one = document.querySelector('.min_menu_title_one');
const min_menu_list_one = document.querySelector('.min_menu_list_one');
const min_menu_title_two = document.querySelector('.min_menu_title_two');
const min_menu_list_two = document.querySelector('.min_menu_list_two');

min_menu_title_one.addEventListener('click', function(){
    if(min_menu_list_one.classList.contains('show')){
        min_menu_list_one.classList.remove('show');
    }
    else{
        min_menu_list_one.classList.add('show');
    }
});

min_menu_title_two.addEventListener('click', function(){
    if(min_menu_list_two.classList.contains('show')){
        min_menu_list_two.classList.remove('show');
    }
    else{
        min_menu_list_two.classList.add('show');
    }
});
