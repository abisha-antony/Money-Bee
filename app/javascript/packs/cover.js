recurse_img();
function recurse_img() {
    let slide_text = document.getElementById('slideshow-text')

    setTimeout(() => {
        hide_all();
        slide_text.innerText = "EARN SMART"
        document.getElementById('earn-img').classList.add("hidden")
        document.getElementById('spend-img').classList.remove("hidden")
        document.getElementById('save-img').classList.remove("hidden")
    }, 1000);
    setTimeout(() => {
        hide_all();
        slide_text.innerText = "SAVE ABUNDANT"
        document.getElementById('save-img').classList.add("hidden")
        document.getElementById('spend-img').classList.remove("hidden")
        document.getElementById('earn-img').classList.remove("hidden")
    }, 5000);
    setTimeout(() => {
        hide_all();
        slide_text.innerText = "SPEND WISE"
        document.getElementById('spend-img').classList.add("hidden")
        document.getElementById('earn-img').classList.remove("hidden")
        document.getElementById('save-img').classList.remove("hidden")
    }, 9000);
    setTimeout(recurse_img , 13500);
}
function hide_all() {
    document.getElementById('earn-img').style.display="none";
    document.getElementById('save-img').style.display="none";
    document.getElementById('spend-img').style.display="none";
}