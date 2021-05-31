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
                var idProyecto = Convert.ToInt32(Request.QueryString["ID"]);
                PROYECTO proyecto = ProyectoModelo.BuscarProyectoPorID(idProyecto);
                CONVENIO con = ConvenioModelo.BuscarConvenioPorNumero(proyecto.num_convenio);
                lblNombreIns.Text = con.nombreInstrumento;
                lblNombreInst.Text = con.nombreInstitucion;
                lblNombreRep.Text = con.nombreRepInstitucion;
                txbNombreProyecto.Text = proyecto.nombreProyecto.ToString();
                txtInicioFecha.Text = Convert.ToString(proyecto.fechaInicio);
                txtFinFecha.Text = Convert.ToString(proyecto.fechaFin);
                idProy.Text = proyecto.idProyecto.ToString();
                //var resultado = ParticipanteControlador.BuscarParticipanteCriterios(txtCriterios.Text);
                //gvParticipante.DataSource = resultado;
                //gvParticipante.DataBind();
            }
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {   ///Agrega los datos registrados a los objetos creados
                var idProyecto = Convert.ToInt32(Request.QueryString["ID"]);
                PROYECTO proyectoModificado = ProyectoControlador.BuscarProyectoPorID(idProyecto);
                proyectoModificado.nombreProyecto = txbNombreProyecto.Text;
                proyectoModificado.fechaInicio = Convert.ToDateTime(txtInicioFecha);
                proyectoModificado.fechaFin = Convert.ToDateTime(txtFinFecha);
                ProyectoControlador.ModificarProyecto(proyectoModificado);
                mensaje.Visible = true;
                string javaScript = "OcultarMensaje();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);
                Response.Redirect("Proyecto.aspx");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void btnAtras_Click(object sender, EventArgs e)
        {
            Response.Redirect("Proyecto.aspx");
        }
        protected void imgEliminar_Command(object sender, CommandEventArgs e)
        {   //Selecciona el proyecto que se desea eliminar
            hiddenId.Value = e.CommandArgument.ToString();
            string javascript = "mostrarModal()";//Abre Modal donde se confirma la accion de eliminar
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javascript, true);
        }
        protected void eliminar_Command(object sender, CommandEventArgs e)
        {   //Elimina el proyecto seleccionado
            var id_proyecto = Convert.ToInt32(hiddenId.Value);
            
            ProyectoControlador.EliminarProyecto(id_proyecto);
            Page_Load(null, null);
        }
        protected void imgModificar_Command(object sender, CommandEventArgs e)
        {   //Selecciona al proyecto que se desea modificar y redirige a la pagina de modificacion
            var idParticipante = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("ModificarParticipante.aspx?ID=" + idParticipante);
        }
        
    }
}