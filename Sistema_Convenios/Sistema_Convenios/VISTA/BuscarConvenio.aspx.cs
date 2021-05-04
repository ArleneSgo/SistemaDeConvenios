using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;
using System.IO;
using CONTROLADOR;
using MODELO;

namespace VISTA
{
    public partial class BuscarConvenio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /* este metodo busca convenios*/
            if (!IsPostBack)
            {
                var resultado = ConvenioControlador.BuscarConvenioCriterios(txtCriterios.Text);
                gvBuscarConvenios.DataSource = resultado;
                gvBuscarConvenios.DataBind();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            var resultado = ConvenioControlador.BuscarConvenioCriterios(txtCriterios.Text);
            gvBuscarConvenios.DataSource = resultado;
            gvBuscarConvenios.DataBind();
            Page_Load(null, null);
        }

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            if (txtCriterios.Text == "" && (rbtnInic.Checked || rbtnFin.Checked))
            {
                if (rbtnInic.Checked)
                {
                    if (dia1.Text != "")
                    {
                        var resultado = ConvenioModelo.BuscarConvenioDiasIni(dia1.Text, dia2.Text);
                        gvBuscarConvenios.DataSource = resultado;
                        gvBuscarConvenios.DataBind();
                    }
                    else if (mes.Text != "")
                    {
                        var resultado = ConvenioModelo.BuscarConvenioMesIni(mes.Text);
                        gvBuscarConvenios.DataSource = resultado;
                        gvBuscarConvenios.DataBind();
                    }
                    else if (year.Text != "")
                    {
                        var resultado = ConvenioModelo.BuscarConvenioAnioIni(year.Text);
                        gvBuscarConvenios.DataSource = resultado;
                        gvBuscarConvenios.DataBind();
                    }
                }
                else
                {
                    if (dia1.Text != "")
                    {
                        var resultado = ConvenioModelo.BuscarConvenioDiasFin(dia1.Text, dia2.Text);
                        gvBuscarConvenios.DataSource = resultado;
                        gvBuscarConvenios.DataBind();
                    }
                    else if (mes.Text != "")
                    {
                        var resultado = ConvenioModelo.BuscarConvenioMesFin(mes.Text);
                        gvBuscarConvenios.DataSource = resultado;
                        gvBuscarConvenios.DataBind();
                    }
                    else if (year.Text != "")
                    {
                        var resultado = ConvenioModelo.BuscarConvenioAnioFin(year.Text);
                        gvBuscarConvenios.DataSource = resultado;
                        gvBuscarConvenios.DataBind();
                    }
                }
            }
            else
            {
                var resultado = ConvenioControlador.BuscarConvenioCriterios(txtCriterios.Text);
                gvBuscarConvenios.DataSource = resultado;
                gvBuscarConvenios.DataBind();

            }
            /*Crea un documento en Excel*/
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            ExcelPackage excel = new ExcelPackage();
            var workSheet = excel.Workbook.Worksheets.Add("Reporte Convenios");
            var totalCols = gvBuscarConvenios.Columns.Count;
            var totalRows = gvBuscarConvenios.Rows.Count;
            /*cuenta las celdas necesarias en la tabla*/
            for (var col = 1; col <= totalCols - 1; col++)
            {
                workSheet.Cells[1, col].Value = gvBuscarConvenios.Columns[col - 1].HeaderText;
            }
            var fila = 1;
            /*convierte la tabla desplegada en la pagina en las celdas del excel generado*/
            foreach (GridViewRow row in gvBuscarConvenios.Rows)
            {
                for (var col = 0; col < totalCols - 1; col++)
                {
                    if (row.Cells[col].Text.Equals("&nbsp;"))
                    {
                        workSheet.Cells[fila + 1, col + 1].Value = "";
                    }
                    else if (row.Cells[col].Text.Equals(""))
                    {
                        workSheet.Cells[fila + 1, col + 1].Value = (row.Cells[col].Controls[1] as Label).Text;
                    }
                    else
                    {
                        workSheet.Cells[fila + 1, col + 1].Value = row.Cells[col].Text;
                    }
                }
                fila++;
            }
            /*modifica el excel agregando cabeceras y lo guarda*/
            using (var memoryStream = new MemoryStream())
            {
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;  filename=ReporteConvenios.xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }

        protected void imgVisualizar_Command(object sender, CommandEventArgs e)
        {
            var numConvenio = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("VisualizarConvenio.aspx?NUM=" + numConvenio);
        }

        protected void txtCriterios_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnAplicar1_Click(object sender, EventArgs e)
        {
            if (rbtnInic.Checked)
            {
                if (dia1.Text != "" && dia2.Text != "")
                {
                    var resultado = ConvenioModelo.BuscarConvenioDiasIni(dia1.Text, dia2.Text);
                    gvBuscarConvenios.DataSource = resultado;
                    gvBuscarConvenios.DataBind();
                    mes.Text = "";
                    year.Text = "";
                    txtCriterios.Text = "";
                    Page_Load(null, null);
                }
                else
                {
                    var datos = "<script> alert('Favor de seleccionar ambas fechas') </script>";
                }
            }
            else if (rbtnFin.Checked)
            {
                if (dia1.Text != "" && dia2.Text != "")
                {
                    var resultado = ConvenioModelo.BuscarConvenioDiasFin(dia1.Text, dia2.Text);
                    gvBuscarConvenios.DataSource = resultado;
                    gvBuscarConvenios.DataBind();
                    mes.Text = "";
                    year.Text = "";
                    txtCriterios.Text = "";
                    Page_Load(null, null);
                }
                else
                {
                    var datos = "<script> alert('Favor de seleccionar ambas fechas') </script>";
                }
            }
        }

        protected void btnAplicar2_Click(object sender, EventArgs e)
        {
            if (rbtnInic.Checked)
            {
                var resultado = ConvenioModelo.BuscarConvenioMesIni(mes.Text);
                gvBuscarConvenios.DataSource = resultado;
                gvBuscarConvenios.DataBind();
                txtCriterios.Text = "";
                dia1.Text = "";
                dia2.Text = "";
                year.Text = "";
            }
            else if (rbtnFin.Checked)
            {
                var resultado = ConvenioModelo.BuscarConvenioMesFin(mes.Text);
                gvBuscarConvenios.DataSource = resultado;
                gvBuscarConvenios.DataBind();
                txtCriterios.Text = "";
                dia1.Text = "";
                dia2.Text = "";
                year.Text = "";
            }
            Page_Load(null, null);
        }

        protected void btnAplicar3_Click(object sender, EventArgs e)
        {
            if (rbtnInic.Checked)
            {
                var resultado = ConvenioModelo.BuscarConvenioAnioIni(year.Text);
                gvBuscarConvenios.DataSource = resultado;
                gvBuscarConvenios.DataBind();
                txtCriterios.Text = "";
                dia1.Text = "";
                dia2.Text = "";
                mes.Text = "";
            }
            else if (rbtnFin.Checked)
            {
                var resultado = ConvenioModelo.BuscarConvenioAnioFin(year.Text);
                gvBuscarConvenios.DataSource = resultado;
                gvBuscarConvenios.DataBind();
                txtCriterios.Text = "";
                dia1.Text = "";
                dia2.Text = "";
                mes.Text = "";
            }
            Page_Load(null, null);
        }

    }
}