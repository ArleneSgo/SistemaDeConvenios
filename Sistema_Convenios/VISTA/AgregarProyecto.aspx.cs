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
    public partial class AgregarProyecto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var numConv = Convert.ToInt32(Request.QueryString["NUM"]);
            CONVENIO conv = ConvenioControlador.BuscarConvenioPorNumero(numConv);
            lblNombreIns.Text = conv.nombreInstrumento;
            lblNombreInst.Text = conv.nombreInstitucion;
            lblNombreRep.Text = conv.nombreRepInstitucion;
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                var numConv = Convert.ToInt32(Request.QueryString["NUM"]);
                CONVENIO conv = ConvenioControlador.BuscarConvenioPorNumero(numConv);
                DateTime? fechaini = null;
                DateTime? fechafin = null;
                /// caso que especifiquen fechas
                if (txtInicioFecha.Text.Length > 0)
                {
                    fechaini = DateTime.Parse(txtInicioFecha.Text);
                }
                if (txtFinFecha.Text.Length > 0)
                {
                    fechafin = DateTime.Parse(txtFinFecha.Text);
                }

                var newproyecto = new PROYECTO()
                {
                    nombreProyecto = txbNombreProyecto.Text,
                    fechaInicio = fechaini,
                    fechaFin = fechafin,
                    num_convenio = Convert.ToInt32(conv.numConvenio),
                    numParticipantes = 0
                };
                ProyectoModelo.InsertarProyecto(newproyecto);
                mensaje.Visible = true;
                string javaScript = "OcultarMensaje();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);
                Response.Redirect("Participantes.aspx");
            }
            catch (Exception ex)
            {
                var datos = "<script> alert('" + ex.Message + "') </script>";
                Response.Write(datos);
            }
        }
        protected void btnAtras_Click(object sender, EventArgs e)
        {
            Response.RedirectPermanent("Participantes.aspx");
        }
    }
}