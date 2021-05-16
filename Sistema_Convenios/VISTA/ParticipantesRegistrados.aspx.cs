using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CONTROLADOR;
using MODELO;

namespace VISTA
{
    public partial class ParticipantesRegistrados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {  //Carga el grid de todos los participantes registrados
            var resultado = ParticipanteControlador.BuscarParticipantesCriterios(txtCriterios.Text);
            gvParticipantes.DataSource = resultado;
            gvParticipantes.DataBind();
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {   //Muestra los participantes con los criterios del buscador
            var resultado = ParticipanteControlador.BuscarParticipantesCriterios(txtCriterios.Text);
            gvParticipantes.DataSource = resultado;
            gvParticipantes.DataBind();
            Page_Load(null, null);
        }
        protected void txtCriterios_TextChanged(object sender, EventArgs e)
        {
            //detecta si el texto cambia en el buscador
        }
        protected void imgEliminar_Command(object sender, CommandEventArgs e)
        {   //Selecciona el participante que se desea eliminar
            hiddenId.Value = e.CommandArgument.ToString();
            string javascript = "mostrarModal()";//Abre Modal donde se confirma la accion de eliminar
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javascript, true);
        }
        protected void eliminar_Command(object sender, CommandEventArgs e)
        {   //Elimina el participante seleccionado
            var id_participante = Convert.ToInt32(hiddenId.Value);
            ParticipanteControlador.EliminarParticipante(id_participante);
            Page_Load(null, null);
        }
        protected void imgModificar_Command(object sender, CommandEventArgs e)
        {   //Selecciona al participante que se desea modificar y redirige a la pagina de modificacion
            var id_usuario = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("ModificarProyecto.aspx?ID=" + id_usuario);
        }
    }
}