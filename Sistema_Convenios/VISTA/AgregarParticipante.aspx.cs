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
    public partial class AgregarParticipante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                var idProy = Convert.ToInt32(Request.QueryString["ID"]);
                PROYECTO proyecto = ProyectoControlador.BuscarProyectoPorID(idProy);
                var newparticipante = new PARTICIPANTE()
                {
                    nombreParticipante = txbNombreParticipante.Text,
                    rol = rbtn.SelectedValue.ToString(),
                    carrera = txbCarrera.Text,
                    idProyecto = proyecto.idProyecto,
                };
                var num = proyecto.numParticipantes;
                proyecto.numParticipantes = num + 1;
                ParticipanteModelo.InsertarParticipante(newparticipante);
                ProyectoModelo.ModificarProyecto(proyecto);
                mensaje.Visible = true;
                string javaScript = "OcultarMensaje();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);
                Response.Redirect("Proyecto.aspx");
            }
            catch (Exception ex)
            {
                var datos = "<script> alert('" + ex.Message + "') </script>";
                Response.Write(datos);
            }
        }
        protected void btnAtras_Click(object sender, EventArgs e)
        {
            Response.RedirectPermanent("Proyecto.aspx");
        }
    }
}