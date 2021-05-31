using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MODELO;
using CONTROLADOR;

namespace VISTA
{
    public partial class Proyecto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {  //Carga el grid de todos los proyectos registrados
            var resultado = ProyectoControlador.BuscarTablaProyectoCriterios(txtCriterios.Text);
            gvProyectos.DataSource = resultado;
            gvProyectos.DataBind();
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {   //Muestra los participantes con los criterios del buscador
            var resultado = ProyectoControlador.BuscarTablaProyectoCriterios(txtCriterios.Text);
            gvProyectos.DataSource = resultado;
            gvProyectos.DataBind();
            Page_Load(null, null);
        }
        protected void txtCriterios_TextChanged(object sender, EventArgs e)
        {
            //detecta si el texto cambia en el buscador
        }
        protected void imgEliminar_Command(object sender, CommandEventArgs e)
        {   //Selecciona el proyecto que se desea eliminar
            hiddenId.Value = e.CommandArgument.ToString();
            string javascript = "mostrarModal()";//Abre Modal donde se confirma la accion de eliminar
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javascript, true);
        }
        protected void eliminar_Command(object sender, CommandEventArgs e)
        {   //Elimina el proyecto seleccionado
            var id_proyecto = Convert.ToInt32(hiddenId.Value);
            ProyectoControlador.EliminarProyecto(id_proyecto);
            Page_Load(null, null);
        }
        protected void imgModificar_Command(object sender, CommandEventArgs e)
        {   //Selecciona al proyecto que se desea modificar y redirige a la pagina de modificacion
            var idProyecto = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("ModificarProyecto.aspx?ID=" + idProyecto);
        }
        protected void imgAgregar_Command(object sender, CommandEventArgs e)
        {   //Selecciona al participante que se desea agregar y redirige a la pagina de modificacion
            var idProyecto = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("AgregarParticipante.aspx?ID=" + idProyecto);
        }
    }
}