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
    public partial class InicioSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            var newUsuario = new USUARIO()
            {
                contrasena = txtContrasena.Text,
                email = txtUsuario.Text,
            };
            var usuario = UsuarioModelo.IngresarSistema(newUsuario);
            Session.Timeout = 20;
            if (usuario != null)
            {
                Session["nombre"] = usuario.nombre + " " + usuario.primer_apellido;
                Session["id_rol"] = usuario.tipoUsuario;
                Session["id_usuario"] = usuario.id_usuario;
                Response.Redirect("Inicio.aspx");
            }
            else
            {
                mensajeError.Visible = true;
            }
        }
    }
}