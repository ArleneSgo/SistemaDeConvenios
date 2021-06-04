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
                txtSemestre.Text = participantes.semestre;
                for (int i = participantes.PARTICIPANTE_CARRERA.Count; i < participantes.num_participantes; i++)
                {
                    participantes.PARTICIPANTE_CARRERA.Add(new PARTICIPANTE_CARRERA());
                }
                Repeater1.DataSource = participantes.PARTICIPANTE_CARRERA;
                Repeater1.DataBind();
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
                participanteModificado.semestre = txtSemestre.Text;
                participanteModificado.PARTICIPANTE_CARRERA.Clear();
                foreach (RepeaterItem item in Repeater1.Items)
                {
                    TextBox txtNombre = item.FindControl("Nombre") as TextBox;
                    DropDownList ddlCarrera = item.FindControl("CarreraDDL") as DropDownList;
                    HiddenField idParticipanteCarrera = item.FindControl("hiddenID") as HiddenField;
                    PARTICIPANTE_CARRERA pc = new PARTICIPANTE_CARRERA()
                    {
                        idParticipanteCarrera = Convert.ToInt32(idParticipanteCarrera.Value),
                        nombreAlumno = txtNombre.Text,
                        nombreCarrera = ddlCarrera.SelectedValue
                    };
                    participanteModificado.PARTICIPANTE_CARRERA.Add(pc);
                }
                ParticipanteControlador.ModificarParticipante(participanteModificado); 
                convenio.num_participantes = convenio.num_participantes + participanteModificado.num_participantes;
                
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