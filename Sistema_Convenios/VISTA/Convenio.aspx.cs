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
    public partial class Convenio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var resultado = ConvenioControlador.BuscarConvenioCriterios(txtCriterios.Text);
            gvBuscarConvenios.DataSource = resultado;
            gvBuscarConvenios.DataBind();
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            var resultado = ConvenioControlador.BuscarConvenioCriterios(txtCriterios.Text);
            gvBuscarConvenios.DataSource = resultado;
            gvBuscarConvenios.DataBind();
            Page_Load(null, null);
        }
        protected void imgEliminar_Command(object sender, CommandEventArgs e)
        {
            hiddenId.Value = e.CommandArgument.ToString();
            string javascript = "mostrarModal()";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javascript, true);
        }
        protected void eliminar_Command(object sender, CommandEventArgs e)
        {
            var numConvenio = Convert.ToInt32(hiddenId.Value);
            ConvenioControlador.EliminarConvenio(numConvenio);
            Page_Load(null, null);
        }
        protected void txtCriterios_TextChanged(object sender, EventArgs e)
        {

        }
        protected void imgModificar_Command(object sender, CommandEventArgs e)
        {
            var numConvenio = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("ModificarConvenio.aspx?NUM=" + numConvenio);
        }
        protected void imgRenovar_Command(object sender, CommandEventArgs e)
        {
            var numConvenio = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("RenovarConvenio.aspx?NUM=" + numConvenio);
        }
    }
}