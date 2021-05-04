function OcultarMensajeError() {
    setTimeout(function () {
        $('#mensajeError').fadeOut('fast');
    }, 5000);
}

function mostrarModal() {
    jQuery(document).ready(function () {
        jQuery('#modalEliminar').modal('show')
    })
}