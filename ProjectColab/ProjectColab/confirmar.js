function Confirmar() {
    return confirm('Deseja realmente sair?')
}
function alerta() {
    console.log(document.getElementsByClassName("status").value);
    if (document.getElementsByClassName("status").value = "EM ATENDIMENTO") {
        document.getElementsByClassName("status").style = [color = "#FF0F0F"];
        console.log();

    }
}

//Confirmar arquivo .pdf
$(document).ready(function () {
    document.getElementById("ContentPlaceHolder1_arquivo").setAttribute('accept', 'application/pdf');
})