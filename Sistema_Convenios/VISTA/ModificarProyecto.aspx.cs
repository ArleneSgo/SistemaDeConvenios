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
    public partial class ModificarProyecto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {   ///Despliega en las casillas los datos del objeto registrados en la base de datos
                var idParticipantes = Convert.ToInt32(Request.QueryString["ID"]);
                PARTICIPANTE participantes = ParticipanteModelo.BuscarParticipantePorID(idParticipantes);
                txbNombreProyecto.Text = participantes.nombreProyecto.ToString();
                txbNumParticipantes.Text = participantes.num_participantes.ToString();
            }
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {   ///Agrega los datos registrados a los objetos creados
                var idParticipantes = Convert.ToInt32(Request.QueryString["ID"]);
                PARTICIPANTE participanteModificado = ParticipanteControlador.BuscarParticipantePorID(idParticipantes);
                CONVENIO convenio = ConvenioControlador.BuscarConvenioPorNumero(Convert.ToInt32(participanteModificado.num_convenio));
                if (participanteModificado.num_participantes == convenio.num_participantes)
                    convenio.num_participantes = 0;
                else
                    convenio.num_participantes = convenio.num_participantes - participanteModificado.num_participantes;
                participanteModificado.num_participantes = Convert.ToInt32(txbNumParticipantes.Text);
                ParticipanteControlador.ModificarParticipante(participanteModificado); convenio.num_participantes = convenio.num_participantes + participanteModificado.num_participantes;
                ConvenioControlador.ModificarConvenio(convenio);
                mensaje.Visible = true;
                string javaScript = "OcultarMensaje();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);
                Response.Redirect("ParticipantesRegistrados.aspx");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void btnAtras_Click(object sender, EventArgs e)
        {
            Response.Redirect("ParticipantesRegistrados.aspx");
        }
    }
}