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
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ///muestra calendario
            Calendar1.SelectedDate = System.DateTime.Now;
            Calendar2.SelectedDate = System.DateTime.Now.AddMonths(3);
            ///si es cero despliega no hay
            if (gvBuscarConvenios.Rows.Count == 0)
            {

                lblNohay.Visible = true;
            }
        }
    }
}