

function validarPass() {
    var passUser1, passUser2;

passUser1 = document.getElementById('passUser1');
passUser2 = document.getElementById('passUser2');
    if(passUser1.value != passUser2.value){
        alert("Contraseñas no concuerdan");
        document.getElementById("passUser1").value="";
        document.getElementById("passUser2").value="";
    }  
}