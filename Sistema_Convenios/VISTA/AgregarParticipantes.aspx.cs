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
    public partial class AgregarParticipantes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                var newparticipante = new PARTICIPANTE()
                {
                    nombreProyecto = txbNombreProyecto.Text,
                    num_participantes = Convert.ToInt32(txbNumParticipantes.Text),
                    semestre = txtSemestre.Text
                };
                ParticipanteModelo.InsertarParticipante(newparticipante);
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