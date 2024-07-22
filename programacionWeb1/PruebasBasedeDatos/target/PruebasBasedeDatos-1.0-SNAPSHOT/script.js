/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
const nombre = document.getElementById("nombre")
const apellido = document.getElementById("apellidos")
const email = document.getElementById("email")
const pass = document.getElementById("password")
const passConfirm = document.getElementById("passwordConfirm")
const DOB = document.getElementById("DOB")
const form = document.getElementById("formulario")
const enviar = document.getElementById("enviar")

const expresiones = {
    nombre: /^[a-zA-ZÀ-ÿ\s]{1,40}$/,
    email: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/,
    pass: /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/
}

$(function () {
    var dtToday = new Date();

    var month = dtToday.getMonth() + 1;// jan=0; feb=1 .......
    var day = dtToday.getDate();
    var year = dtToday.getFullYear() - 18;
    if (month < 10)
        month = '0' + month.toString();
    if (day < 10)
        day = '0' + day.toString();
    var minDate = year + '-' + month + '-' + day;
    var maxDate = year + '-' + month + '-' + day;
    $('#DOB').attr('max', maxDate);
});


//form.addEventListener("submit", e=> {
//    e.preventDefault()
//    let entrar= false;
//    
//    if(nombre.value.match(expresiones.nombre) && apellido.value.match(expresiones.nombre) && email.value.match(expresiones.email) && pass.value.match(expresiones.pass) && pass.value == passConfirm.value){
//        entrar = true;
//    }
//    
//    if(!nombre.value.match(expresiones.nombre)){
//        alert("Error el nombre solo puede contener letras y/o espacios");  
//
//    }
//
//    if(!apellido.value.match(expresiones.nombre)){
//        alert("Error el nombre solo puede contener letras y/o espacios");
//    }
//
//    if(!email.value.match(expresiones.email)){
//        alert("Error el correo no tiene un formato correcto");
//    }
//
//    if(!pass.value.match(expresiones.pass)){
//        alert("Error la contraseña no tiene un formato correcto");
//    }
//
//    if(pass.value !== passConfirm.value){
//        alert("Error las contraseñas no coinciden");
//    }
//
//   if(entrar){
//      form.reset();
//    }else{
//       
//        alert("No se puede enviar la informacion");
//    }
//})



function mostrarImagen(event) {
    var imagenSource = event.target.result;
    var previewImage = document.getElementById('preview');

    previewImage.src = imagenSource;

}


function procesarArchivo(event) {
    var imagen = event.target.files[0];

    var lector = new FileReader();
    lector.addEventListener('load', mostrarImagen, false);
    lector.readAsDataURL(imagen);
}

document.getElementById('archivo').addEventListener('change', procesarArchivo, false)

function allLetter(inputtxt)
{
    var letters = /^[A-Za-z]+$/;
    if (inputtxt.value.match(letters))
    {
        return true;
    } else
    {
        alert("message");
        return false;
    }
}
function lettersAndSpaceCheck(nombre)
{
    var regEx = /^[a-z][a-z\s]*$/;
    if (nombre.value.match(regEx))
    {
        return true;
    } else
    {
        alert("Please enter letters and space only.");
        return false;
    }
}






