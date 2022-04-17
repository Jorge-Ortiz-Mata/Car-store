const notice_section = document.querySelector('.alert');
const close_button_notice = document.querySelector('#close_alert');

close_button_notice.addEventListener('click', function(){
    notice_section.classList.add('hide_alert');
});