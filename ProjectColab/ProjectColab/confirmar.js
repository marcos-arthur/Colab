function Confirmar() {
    return confirm('Deseja realmente sair?')
}

//Confirmar arquivo .pdf
$(document).ready(function () {
    document.getElementById("ContentPlaceHolder1_arquivo").setAttribute('accept', 'application/pdf');
})