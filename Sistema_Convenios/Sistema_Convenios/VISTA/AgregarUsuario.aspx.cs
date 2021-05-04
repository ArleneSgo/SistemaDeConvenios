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
    public partial class AgregarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                var newusuario = new USUARIO()
                {
                    tipoUsuario = Convert.ToInt32(rbtn.SelectedValue),
                    nombre = txtNombre.Text,
                    primer_apellido = txtPrimerApellido.Text,
                    segundo_apellido = txtSegundoApellido.Text,
                    email = txtCorreoElectronico.Text,
                    telefono = txtTelefono.Text,
                    contrasena = txtContrasena.Text,
                    empresa = txtEmpresa.Text,
                };
                UsuarioModelo.InsertarUsuario(newusuario);
                mensaje.Visible = true;
                string javaScript = "OcultarMensaje();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);
                Response.Redirect("Usuarios.aspx");
            }

            catch (Exception ex)
            {
                var datos = "<script> alert('" + ex.Message + "') </script>";
                Response.Write(datos);
            }
        }
        protected void btnAtras_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuarios.aspx");
        }
    }
}