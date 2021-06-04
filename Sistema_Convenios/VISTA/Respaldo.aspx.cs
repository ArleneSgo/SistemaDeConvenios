using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VISTA
{
    public partial class Respaldo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int tipousuario = (int)Session["id_rol"];
            if (tipousuario != 1)
            {
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
        protected void btnRespaldar_Click(object sender, EventArgs e)
        {
            // read connectionstring from config file
            var connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SISTEMADECONVENIOSConnectionString"].ConnectionString;

            var sqlConStrBuilder = new SqlConnectionStringBuilder(connectionString);

            var backupFileName = String.Format("{0}{1}-{2}.bak",
                Server.MapPath("~/Include/"), sqlConStrBuilder.InitialCatalog,
                DateTime.Now.ToString("yyyy-MM-dd"));

            using (var connection = new SqlConnection(sqlConStrBuilder.ConnectionString))
            {
                var query = String.Format("BACKUP DATABASE {0} TO DISK='{1}'",
                    sqlConStrBuilder.InitialCatalog, backupFileName);

                using (var command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

            var objRespaldo = new System.IO.FileInfo(backupFileName);
            Response.Clear();
            Response.AddHeader("Content-Disposition", "attachment; filename=" + sqlConStrBuilder.InitialCatalog+
                DateTime.Now.ToString("yyyy-MM-dd"));
            Response.AddHeader("Content-Length", objRespaldo.Length.ToString());
            Response.ContentType = "application/octet-stream";
            Response.WriteFile(objRespaldo.FullName);
            Response.End();

        }
        protected void btnAtras_Click(object sender, EventArgs e)
        {   ///Regresa a la pantalla del grid de convenios
            Response.Redirect("buscarConvenio.aspx");
        }
    }
}