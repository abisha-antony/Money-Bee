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
