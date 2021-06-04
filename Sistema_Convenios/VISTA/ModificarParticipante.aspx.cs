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
    public partial class ModificarParticipante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {  
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToInt32(proyectoSeleccionado.SelectedValue) == 1)
                {
                }
                else
                {   ///Agrega los datos registrados al objeto creado
                    var numCon = Convert.ToInt32(Request.QueryString["NUM"]);
                    var idParticipante = Convert.ToInt32(proyectoSeleccionado.SelectedValue);
                    PARTICIPANTE participanteModificado = ParticipanteControlador.BuscarParticipantePorID(idParticipante);
                    int num_participantes = Convert.ToInt32(participanteModificado.num_participantes);
                    CONVENIO convenio = ConvenioControlador.BuscarConvenioPorNumero(Convert.ToInt32(numCon));
                    convenio.num_participantes = convenio.num_participantes + num_participantes;
                    ConvenioControlador.ModificarConvenio(convenio);
                    participanteModificado.num_convenio = Convert.ToInt32(numCon);
                    foreach (RepeaterItem item in Repeater1.Items)
                    {
                        TextBox txtNombre = item.FindControl("Nombre") as TextBox;
                        DropDownList ddlCarrera = item.FindControl("CarreraDDL") as DropDownList;
                        PARTICIPANTE_CARRERA participante = new PARTICIPANTE_CARRERA()
                        {
                            nombreAlumno = txtNombre.Text,
                            nombreCarrera = ddlCarrera.SelectedValue
                        };
                        participanteModificado.PARTICIPANTE_CARRERA.Add(participante);
                    }
                    ParticipanteControlador.ModificarParticipante(participanteModificado);
                    mensaje.Visible = true;
                    string javaScript = "OcultarMensaje();";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);
                }
                Response.Redirect("Participantes.aspx");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void btnAtras_Click(object sender, EventArgs e)
        {
            Response.Redirect("Participantes.aspx");
        }

        protected void proyectoSeleccionado_SelectedIndexChanged(object sender, EventArgs e)
        {
            var idParticipante = Convert.ToInt32(proyectoSeleccionado.SelectedValue);
            PARTICIPANTE participanteModificado = ParticipanteControlador.BuscarParticipantePorID(idParticipante);
            if (participanteModificado.num_participantes != null)
            {
                Repeater1.DataSource = new int[(int)participanteModificado.num_participantes];
                Repeater1.DataBind();
            }

        }
    }
}