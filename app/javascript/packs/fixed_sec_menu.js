const secondaryMenu = document.querySelector('.header_secondary');

scrollFunction = () => {
    let scrollValue = window.pageYOffset;
    if(scrollValue > 50){
        secondaryMenu.classList.add('fixed_menu');
    }
    else if(scrollValue < 50){
        secondaryMenu.classList.remove('fixed_menu');
    }
}

window.addEventListener('scroll', scrollFunction);
