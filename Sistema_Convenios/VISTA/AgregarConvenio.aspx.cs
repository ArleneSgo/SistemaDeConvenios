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
    public partial class AgregarConvenio : System.Web.UI.Page
    {
        
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int totalmeses = 0;
            DateTime? fechaini = null;
            DateTime? fechafin = null;
            var pubbit = rbtnSiMedio.Checked;
            var propInt = rbtnSiPropInt.Checked;
            bool ods = rbtnSiODS.Checked;
            int? natmod = null;
            int? becmod = null;
            int rec=2;
            int tipoconv;
            int tipo2;
            int sector = Convert.ToInt32(rbtnSector.SelectedValue);
            int actecon = 3;
            int acteconnum = 0;
            int ambito = 2;
            int? odsselect;
            String eje = "";
            float? monto = null;

            /// formula para calcular meses
            if (txtInicioFecha.Text.Length != 0 && txtFinFecha.Text.Length != 0)
            {
                string separarfechainic = txtInicioFecha.Text;
                string separarfechafin = txtFinFecha.Text;
                string[] separainic = separarfechainic.Split('-');
                string[] separafin = separarfechafin.Split('-');
                var InicYear = separainic[0];
                var FinYear = separafin[0];
                var InicMonth = separainic[1];
                var FinMonth = separafin[1];

                var months = 12 - Convert.ToInt32(InicMonth);
                var years = Convert.ToInt32(FinYear) - Convert.ToInt32(InicYear);
                if (years != 0)
                {
                    for (int i = 0; i < years; i++)
                    {
                        totalmeses = i * 12;
                    }
                    totalmeses = totalmeses + months + Convert.ToInt32(FinMonth);
                }
                else
                {
                    totalmeses = Convert.ToInt32(FinMonth) - Convert.ToInt32(InicMonth);
                }
            }

            /// caso que especifiquen fechas
            if (txtInicioFecha.Text.Length > 0)
            {
                fechaini = DateTime.Parse(txtInicioFecha.Text);
            }
            if (txtFinFecha.Text.Length > 0)
            {
                fechafin = DateTime.Parse(txtFinFecha.Text);
            }

            ///Tipo de modalidad
            if (rbtnPresencial.Checked == true)
            {
                natmod = Convert.ToInt32(rbtnPresencial.Value);
            }
            else if (rbtnVirtual.Checked == true)
            {
                natmod = Convert.ToInt32(rbtnVirtual.Value);
            }
            else if (rbtnMixta.Checked == true)
            {
                natmod = Convert.ToInt32(rbtnMixta.Value);
            }

            ///tipo modalidad beca
            if (rbtnPresencialBecas.Checked == true)
            {
                becmod = Convert.ToInt32(rbtnPresencialBecas.Value);
            }
            else if (rbtnVirtualBecas.Checked == true)
            {
                becmod = Convert.ToInt32(rbtnVirtualBecas.Value);
            }
            else if (rbtnMixtaBecas.Checked == true)
            {
                becmod = Convert.ToInt32(rbtnMixtaBecas.Value);
            }

            ///tipo de recurso
            if (rbtnFinancieros.Checked == true)
            {
                rec = Convert.ToInt32(rbtnFinancieros.Value);
            }
            else if (rbtnHumanos.Checked == true)
            {
                rec = Convert.ToInt32(rbtnHumanos.Value);
            }
            else if (rbtnInfraestructura.Checked == true)
            {
                rec = Convert.ToInt32(rbtnInfraestructura.Value);
            }
            else if (rbtnEquipo.Checked == true)
            {
                rec = Convert.ToInt32(rbtnEquipo.Value);
            }
            else if (rbtnTecnologicos.Checked == true)
            {
                rec = Convert.ToInt32(rbtnTecnologicos.Value);
            }
            
            ///revisar si hay monto
            if (txtMonto.Text.Length != 0)
            {
                monto = float.Parse(txtMonto.Text);
            }

            ///revisar tipo convenio
            tipoconv =Convert.ToInt32( rbtnTipo.SelectedValue);
            
            tipo2 = Convert.ToInt32(rbtnTipo2.SelectedValue);
            
            ///act econ
            if (rbtnPrimaria.Checked == true)
            {
                actecon = Convert.ToInt32(rbtnPrimaria.Value);
                acteconnum = Convert.ToInt32(primariaDDL.SelectedValue);
            }
            else if (rbtnSecundaria.Checked == true)
            {

                actecon = Convert.ToInt32(rbtnSecundaria.Value);
                acteconnum = Convert.ToInt32(secundariaDDL.SelectedValue);
            }
            else if (rbtnTerciaria.Checked == true)
            {

                actecon = Convert.ToInt32(rbtnTerciaria.Value);
                acteconnum = Convert.ToInt32(terciariaDDL.SelectedValue);
            }
            ///ambito
            ambito =Convert.ToInt32( rbtnAmbito.SelectedValue);
            
            ///eje
            if (cbxEducacion.Checked == true)
            {
                eje = cbxEducacion.Value + "_";
            }
            if (cbxCiencia.Checked == true)
            {
                eje = cbxCiencia.Value + "_";
            }
            if (cbxDesarrollo.Checked == true)
            {
                eje = eje + cbxDesarrollo.Value + "_";
            }
            if (cbxCultura.Checked == true)
            {
                eje = eje + cbxCultura.Value + "_";
            }
            if (cbxDeporte.Checked == true)
            {
                eje = eje + cbxDeporte.Value + "_";
            }
            if (cbxOtro.Checked == true)
            {
                eje = eje + txtOtro.Text.ToUpper() + "_";
            }

            ///ods
            if (ods == false)
            {
                odsselect = null;
            }
            else
            {
                odsselect = Convert.ToInt32(odsDDL.SelectedValue);
            }

            ///insertar
            if (totalmeses != 0)
            {
                try
                {
                    var newconvenio = new CONVENIO()
                    {
                        nombreInstrumento = NomJurDDL.SelectedValue.ToString(),
                        inicioConvenio = fechaini,
                        finConvenio = fechafin,
                        plazoConvenio = totalmeses.ToString(),
                        publicadoActivo =Convert.ToBoolean( pubbit),
                        publicadoDonde = txtMedio.Text.ToUpper(),
                        objetivoInstrumento = ObjJurDDL.SelectedValue,
                        idNaturaleza = Convert.ToInt32(NaturalezaDDL.SelectedValue),
                        naturalezaModalidad = natmod,
                        becas = txtBecas.Text.ToUpper(),
                        movilidad = becmod,
                        prestacionServicio = txtPrestacion.Text.ToUpper(),
                        donacion = txtDonacion.Text.ToUpper(),
                        comodato = txtComodato.Text.ToUpper(),
                        educacionContinua = txtEducacion.Text.ToUpper(),
                        nombreRepITH = txtNombreRepITH.Text.ToUpper(),
                        nombreInstitucion = txtNombreInstitucion.Text.ToUpper(),
                        nombreRepInstitucion = txtNombreRepInstitucion.Text.ToUpper(),
                        cargoRepInstitucion = txtCargoRepInstitucion.Text.ToUpper(),
                        idRecursos = rec,
                        montoRecursoFinanciero = monto,
                        propiedadIntelActivo =Convert.ToBoolean( propInt),
                        propiedadIntelDonde = txtPropiedadInt.Text.ToUpper(),
                        entregable = txtEntregables.Text.ToUpper(),
                        idTipoConvenio = tipoconv,
                        idTipoConvenioEsp = tipo2,
                        idSector = sector,
                        idActEcon = actecon,
                        cantidadActEcon = acteconnum,
                        idAmbito = ambito,
                        eje = eje,
                        ODSActivo = ods,
                        idODS = odsselect,
                        num_participantes = 0,
                    };
                    CompareValidator2.Validate();
                    ConvenioModelo.InsertarConvenio(newconvenio);
                    mensaje.Visible = true;

                    string javaScript = "OcultarMensaje();";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);

                }
                catch (Exception ex)
                {
                    var datos = "<script> alert('" + ex.Message + "') </script>";
                }
            }
            else
            {
                try
                {
                    var newconvenio = new CONVENIO()
                    {
                        nombreInstrumento = NomJurDDL.SelectedValue.ToString(),
                        inicioConvenio = fechaini,
                        finConvenio = fechafin,
                        plazoConvenio = "INDEFINIDO",
                        publicadoActivo =Convert.ToBoolean( pubbit),
                        publicadoDonde = txtMedio.Text.ToUpper(),
                        objetivoInstrumento = ObjJurDDL.SelectedValue,
                        idNaturaleza = Convert.ToInt32(NaturalezaDDL.SelectedValue),
                        naturalezaModalidad = natmod,
                        becas = txtBecas.Text.ToUpper(),
                        movilidad = becmod,
                        prestacionServicio = txtPrestacion.Text.ToUpper(),
                        donacion = txtDonacion.Text.ToUpper(),
                        comodato = txtComodato.Text.ToUpper(),
                        educacionContinua = txtEducacion.Text.ToUpper(),
                        nombreRepITH = txtNombreRepITH.Text.ToUpper(),
                        nombreInstitucion = txtNombreInstitucion.Text.ToUpper(),
                        nombreRepInstitucion = txtNombreRepInstitucion.Text.ToUpper(),
                        cargoRepInstitucion = txtCargoRepInstitucion.Text.ToUpper(),
                        idRecursos = rec,
                        montoRecursoFinanciero = monto,
                        propiedadIntelActivo =Convert.ToBoolean( propInt),
                        propiedadIntelDonde = txtPropiedadInt.Text.ToUpper(),
                        entregable = txtEntregables.Text.ToUpper(),
                        idTipoConvenio = tipoconv,
                        idTipoConvenioEsp = tipo2,
                        idSector = sector,
                        idActEcon = actecon,
                        cantidadActEcon = acteconnum,
                        idAmbito = ambito,
                        eje = eje,
                        ODSActivo = ods,
                        idODS = odsselect,
                    };

                    ConvenioModelo.InsertarConvenio(newconvenio);
                    mensaje.Visible = true;

                    string javaScript = "OcultarMensaje();";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);

                }
                catch (Exception ex)
                {
                    var datos = "<script> alert('" + ex.Message + "') </script>";
                    Response.Write(datos);
                }
            }
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }
    }
}