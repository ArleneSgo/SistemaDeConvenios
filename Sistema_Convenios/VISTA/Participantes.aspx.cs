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
    public partial class Participantes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {   //Carga el grid de todos los participantes
            var resultado = ConvenioControlador.BuscarConvenioCriterios(txtCriterios.Text);
            gvConvenios.DataSource = resultado;
            gvConvenios.DataBind();
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {   //Muestra los participantes con los criterios del buscador
            var resultado = ConvenioControlador.BuscarConvenioCriterios(txtCriterios.Text);
            gvConvenios.DataSource = resultado;
            gvConvenios.DataBind();
            Page_Load(null, null);
        }
        protected void txtCriterios_TextChanged(object sender, EventArgs e)
        {
            //detecta si el texto cambia en el buscador
        }
        protected void imgAgregar_Command(object sender, CommandEventArgs e)
        {   //Selecciona al participante que se desea modificar y redirige a la pagina de modificacion
            var numConvenio = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("AgregarProyecto.aspx?NUM=" + numConvenio);
        }
        
    }
}
