using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VISTA
{
    public partial class PagMaestra : System.Web.UI.MasterPage
    {
        protected string nombreUsuario;

        protected void Page_Load(object sender, EventArgs e)
        {  ///Identifica al usuario en sesion y muestra los menus respecto a su rol
            var sesion = Convert.ToInt32(Session["id_usuario"]);
            if (sesion != 0)
            {
                nombreUsuario = Session["nombre"].ToString();
                //DataBind();
                HyperLink1.NavigateUrl = ("ModificarUsuario.aspx?ID=" + sesion);///redirige a la pagina del perfil
                var rol = Convert.ToInt32(Session["id_rol"]);
                if (rol != 1)
                {
                    linkUsuarios.Visible = false;
                    linkAgregarConvenio.Visible = false;
                    linkModificarConvenio.Visible = false;
                    linkRenovarConvenio.Visible = false;
                    linkRespaldo.Visible = false;
                }
                Session["LoginId"] = sesion;
            }
            else
            {
                Response.Redirect("InicioSesion.aspx", true);///Si no es un usuario valido redirige al inicio 
            }
        }

        protected void cerrarSesion_Click(object sender, EventArgs e)
        {   ///Cierra Sesion
            try
            {
                Session.Abandon();
                Session["LoginId"] = null;
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Buffer = true;
                Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
                Response.Expires = -1000;
                Response.CacheControl = "no-cache";
                Response.Redirect("InicioSesion.aspx", true);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }
    }
}