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
    public partial class ModificarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {   ///Despliega en las casillas los datos del objeto registrados en la base de datos
                var idUsuario = Convert.ToInt32(Request.QueryString["ID"]);
                USUARIO user = UsuarioModelo.BuscarUsuarioPorID(idUsuario);
                txtNombre.Text = user.nombre;
                txtPrimerApellido.Text = user.primer_apellido;
                txtSegundoApellido.Text = user.segundo_apellido;
                txtCorreoElectronico.Text = user.email;
                txtContrasena.Text = user.contrasena;
                txtEmpresa.Text = user.empresa;
                if (user.telefono == "")
                    txtTelefono.Text = "Sin telefono celular";
                else
                    txtTelefono.Text = user.telefono;
                var sesion = Convert.ToInt32(Session["id_usuario"]);
                if (sesion != idUsuario && user.id_usuario == 1)
                {
                    lblContrasena.Visible = false;
                    txtContrasena.Visible = false;
                }
            }
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {   ///Agrega los datos registrados al objeto creado
                var idUsuario = Convert.ToInt32(Request.QueryString["ID"]);
                USUARIO usuarioModificado = UsuarioModelo.BuscarUsuarioPorID(idUsuario);
                usuarioModificado.nombre = txtNombre.Text;
                usuarioModificado.primer_apellido = txtPrimerApellido.Text;
                usuarioModificado.segundo_apellido = txtSegundoApellido.Text;
                usuarioModificado.telefono = txtTelefono.Text;
                usuarioModificado.email = txtCorreoElectronico.Text;
                usuarioModificado.contrasena = txtContrasena.Text;
                usuarioModificado.empresa = txtEmpresa.Text;
                UsuarioControlador.ModificarUsuario(usuarioModificado);
                mensaje.Visible = true;
                string javaScript = "OcultarMensaje();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);
                var sesion = Convert.ToInt32(Session["id_usuario"]);
                if (sesion == idUsuario)
                    Page_Load(null, null);
                else
                    Response.Redirect("Usuarios.aspx");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void btnAtras_Click(object sender, EventArgs e)
        {
            var idUsuario = Convert.ToInt32(Request.QueryString["ID"]);
            USUARIO user = UsuarioModelo.BuscarUsuarioPorID(idUsuario);
            var rol = user.id_usuario;
            if (idUsuario == 1)
            {
                Response.Redirect("Usuarios.aspx");
            }
            else
            {
                Response.Redirect("Inicio.aspx");
            }

        }

    }
}