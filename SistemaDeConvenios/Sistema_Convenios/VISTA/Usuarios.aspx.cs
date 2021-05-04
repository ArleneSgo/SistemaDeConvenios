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
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {  ///Se carga el grid con la informacion de todos los usuarios registrados en la B.D.
            var resultado = UsuarioControlador.BuscarUsuarioCriterios(txtCriterios.Text);
            gvBuscarUsuarios.DataSource = resultado;
            gvBuscarUsuarios.DataBind();
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {   ///Muestra los usuarios que cumplan con los criterios ingresados en el buscador
            var resultado = UsuarioControlador.BuscarUsuarioCriterios(txtCriterios.Text);
            gvBuscarUsuarios.DataSource = resultado;
            gvBuscarUsuarios.DataBind();
            Page_Load(null, null);
        }
        protected void imgEliminar_Command(object sender, CommandEventArgs e)
        {   ///Selecciona el usuario que se desea eliminar
            hiddenId.Value = e.CommandArgument.ToString();
            string javascript = "mostrarModal()";//Abre Modal donde se confirma la accion de eliminar
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javascript, true);
        }
        protected void eliminar_Command(object sender, CommandEventArgs e)
        {   ///Elimina el usuario seleccionado
            var id_usuario = Convert.ToInt32(hiddenId.Value);
            UsuarioControlador.EliminarUsuario(id_usuario);
            Page_Load(null, null);
        }
        protected void txtCriterios_TextChanged(object sender, EventArgs e)
        {
            ///detecta si el texto cambia en el buscador
        }

        protected void imgModificar_Command(object sender, CommandEventArgs e)
        {  ///Selecciona al usuario que se desea modificar y redirige a la pagina de modificacion
            var id_usuario = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("ModificarUsuario.aspx?ID=" + id_usuario);
        }
    }
}