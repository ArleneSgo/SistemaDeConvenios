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
    public partial class RenovarConvenio : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {   ///Carga el grid de todos convenios
            var resultado = ConvenioControlador.BuscarConvenioCriterios(txtCriterios.Text);
            gvBuscarConvenios.DataSource = resultado;
            gvBuscarConvenios.DataBind();
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {   ///Muestra los convenios con los criterios del buscador
            var resultado = ConvenioControlador.BuscarConvenioCriterios(txtCriterios.Text);
            gvBuscarConvenios.DataSource = resultado;
            gvBuscarConvenios.DataBind();
            Page_Load(null, null);
        }
        protected void txtCriterios_TextChanged(object sender, EventArgs e)
        {
            ///detecta si el texto cambia en el buscador
        }
        protected void imgRenovar_Command(object sender, CommandEventArgs e)
        {   ///Selecciona al convenio y redirige a la pagina de modificacion
            var numConvenio = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("ModificarFechaConvenio.aspx?NUM=" + numConvenio);
        }
    }
}