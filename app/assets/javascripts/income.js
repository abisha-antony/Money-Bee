function show_popup() {
    document.getElementById('main-div').style.filter="blur(10px)";
    document.getElementById('popup-form').style.display = "block";
}
function hide_popup() {
    document.getElementById('main-div').style.filter="blur(0px)";
    document.getElementById('popup-form').style.display = "none";
}
document.getElementById('add-action-btn').addEventListener('click', show_popup);
document.getElementById('popup-cancel').addEventListener('click', hide_popup);
