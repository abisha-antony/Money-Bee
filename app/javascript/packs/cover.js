recurse_img();
function recurse_img() {
    let slide_text = document.getElementById('slideshow-text')

    setTimeout(() => {
        hide_all();
        document.getElementById('earn-img').style.display = "block"
    }, 1000);
    setTimeout(() => {
        hide_all();
        document.getElementById('save-img').style.display = "block"
    }, 5000);
    setTimeout(() => {
        hide_all();
        document.getElementById('spend-img').style.display = "block"
    }, 9000);
    setTimeout(recurse_img , 13500);
}
function hide_all() {
    document.getElementById('earn-img').style.display="none";
    document.getElementById('save-img').style.display="none";
    document.getElementById('spend-img').style.display="none";
}