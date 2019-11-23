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

function sumir() {
    document.getElementById("btn").style.display = "none";
    console.log(2);
}

function chamado() {
    if{
        document.getElementById("statusdochamado").style.display = "none";
        console.log(2);
    }
}