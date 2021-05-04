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
    public partial class ModificarFechaConvenio : System.Web.UI.Page
    {
        int totalmeses = 0;
        DateTime? fechaini = null;
        DateTime? fechafin = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {   //Despliega en las casillas los datos del objeto registrados en la base de datos
                var numCon = Convert.ToInt32(Request.QueryString["NUM"]);
                CONVENIO convenio = ConvenioModelo.BuscarConvenioPorNumero(numCon);
                txbNumConvenio.Text = convenio.numConvenio.ToString();
                txbFechaInicio.Text = convenio.inicioConvenio.ToString();
                txbFechaFin.Text = convenio.finConvenio.ToString();
                txbPlazo.Text = convenio.plazoConvenio.ToString();
            }
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (txbFechaInicio.Text.Length > 0)
                fechaini = DateTime.Parse(txbFechaInicio.Text);
            if (txbFechaFin.Text.Length > 0)
                fechafin = DateTime.Parse(txbFechaFin.Text);
            try
            {
                var numCon = Convert.ToInt32(Request.QueryString["NUM"]);
                CONVENIO convenioModificado = ConvenioControlador.BuscarConvenioPorNumero(numCon);
                convenioModificado.inicioConvenio = fechaini;
                convenioModificado.finConvenio = fechafin;
                convenioModificado.plazoConvenio = txbPlazo.Text;
                CompareValidator1.Validate();
                ConvenioControlador.ModificarFechaConvenio(convenioModificado);
                mensaje.Visible = true;
                string javaScript = "OcultarMensaje();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);
            }
            catch (Exception ex)
            {
                var datos = "<script> alert('" + ex.Message + "') </script>";
                Response.Write(datos);
            }
        }
        protected void btnAtras_Click(object sender, EventArgs e)
        {
            Response.Redirect("RenovarConvenio.aspx");
        }

        protected void txbFecha_TextChanged(object sender, EventArgs e)
        {
            //calcular meses
            if (txbFechaInicio.Text.Length != 0 && txbFechaFin.Text.Length != 0)
            {
                string separarfechainic = txbFechaInicio.Text;
                string separarfechafin = txbFechaFin.Text;
                string[] separainic = separarfechainic.Split('-');
                string[] separafin = separarfechafin.Split('-');
                var InicYear = separainic[0];
                var FinYear = separafin[0];
                var InicMonth = separainic[1];
                var FinMonth = separafin[1];
                var months = 12 - Convert.ToInt32(InicMonth);
                var years = Convert.ToInt32(FinYear) - Convert.ToInt32(InicYear);
                if (years != 0)
                {
                    for (int i = 0; i < years; i++)
                        totalmeses = i * 12;
                    totalmeses = totalmeses + months + Convert.ToInt32(FinMonth);
                }
                else
                {
                    totalmeses = Convert.ToInt32(FinMonth) - Convert.ToInt32(InicMonth);
                }
            }
            // caso que especifiquen fechas
            if (txbFechaInicio.Text.Length > 0)
                fechaini = DateTime.Parse(txbFechaInicio.Text);
            if (txbFechaFin.Text.Length > 0)
                fechafin = DateTime.Parse(txbFechaFin.Text);
            if (totalmeses == 0)
                txbPlazo.Text = "INDEFINIDO";
            else
                txbPlazo.Text = totalmeses.ToString();

        }
    }
}