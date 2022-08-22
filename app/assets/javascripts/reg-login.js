function show_password() {
    let check = document.getElementById('show-pass-cb');
    if(check.checked){
        document.getElementById('password').type = "text";
        document.getElementById('cpassword').type = "text";
    } else {
        document.getElementById('password').type = "password";
        document.getElementById('cpassword').type = "password";
    }
}
document.getElementById('show-pass-cb').addEventListener("change", show_password);

document.getElementById('submit_btn').addEventListener('click', pw_validator);
function pw_validator() {
    let pw = document.getElementById('password').value
    let cpw = document.getElementById('cpassword').value
    if(pw == cpw){
        let sub_btn = document.getElementById('sub-btn');        
        sub_btn.click();
    }else {
        document.getElementById('warn-div').innerText = "Password do not match"
    }
}