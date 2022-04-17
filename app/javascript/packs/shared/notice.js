const notice_section = document.querySelector('.notice');
const close_button_notice = document.querySelector('#close_notice');

close_button_notice.addEventListener('click', function(){
    notice_section.classList.add('hide_notice');
});