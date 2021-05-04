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
    public partial class ModificarConvenio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {   //Despliega en las casillas los datos del objeto registrados en la base de datos
            if (!IsPostBack)
            {
                var numCon = Convert.ToInt32(Request.QueryString["NUM"]);
                CONVENIO convenio = ConvenioModelo.BuscarConvenioPorNumero(numCon);
                /* nombreInstrumento*/
                NomJurDDL.SelectedValue = convenio.nombreInstrumento;
                /*radio button Publicado*/
                if (convenio.publicadoActivo == true)
                    rbtnSiMedio.Checked = true;
                else if (convenio.publicadoActivo == false)
                    rbtnNoMedio.Checked = true;
                /*publicadoDonde*/
                if (convenio.publicadoDonde.Equals("") || convenio.publicadoDonde.Equals("NULL"))
                    txtMedio.Text = "No publicado";
                else if (!convenio.publicadoDonde.Equals(""))
                    txtMedio.Text = convenio.publicadoDonde;
                /*objeto instrumento*/
                ObjJurDDL.Text = convenio.objetivoInstrumento;
                /*idNaturaleza*/
                if (convenio.idNaturaleza.Equals("") || convenio.publicadoDonde.Equals("NULL"))
                    NaturalezaDDL.SelectedValue = "SELECCIONAR";
                else if (!convenio.idNaturaleza.Equals("") || convenio.publicadoDonde.Equals("NULL"))
                    NaturalezaDDL.SelectedValue = convenio.idNaturaleza.ToString();
                /*naturaleza modalidad*/
                if (convenio.naturalezaModalidad == 1)
                    rbtnPresencial.Checked = true;
                else if (convenio.naturalezaModalidad == 2)
                    rbtnVirtual.Checked = true;
                else if (convenio.naturalezaModalidad == 3)
                    rbtnMixta.Checked = true;
                /*prestacionServicio*/
                if (!convenio.prestacionServicio.Equals("") || convenio.publicadoDonde.Equals("NULL"))
                    txtPrestacion.Text = convenio.prestacionServicio;
                /*donacion*/
                if (!convenio.donacion.Equals("") || convenio.publicadoDonde.Equals("NULL"))
                    txtDonacion.Text = convenio.donacion;
                /*comodato*/
                if (!convenio.comodato.Equals("") || convenio.publicadoDonde.Equals("NULL"))
                    txtComodato.Text = convenio.comodato;
                /*educacionContinua*/
                if (!convenio.educacionContinua.Equals("") || convenio.publicadoDonde.Equals("NULL"))
                    txtEducacion.Text = convenio.educacionContinua;
                /*becas*/
                if (!convenio.becas.Equals("") || convenio.publicadoDonde.Equals("NULL"))
                    txtBecas.Text = convenio.becas;
                /*movilidad*/
                if (convenio.movilidad == 1)
                    rbtnPresencialBecas.Checked = true;
                else if (convenio.movilidad == 2)
                    rbtnVirtualBecas.Checked = true;
                else if (convenio.movilidad == 3)
                    rbtnMixtaBecas.Checked = true;
                /**/
                txtNombreRepITH.Text = convenio.nombreRepITH;
                /**/
                txtNombreInstitucion.Text = convenio.nombreInstitucion;
                /**/
                txtNombreRepInstitucion.Text = convenio.nombreRepInstitucion;
                /**/
                txtCargoRepInstitucion.Text = convenio.cargoRepInstitucion;
                /**/
                if (convenio.idRecursos == 1)
                    rbtnFinancieros.Checked = true;
                else if (convenio.idRecursos == 2)
                    rbtnHumanos.Checked = true;
                else if (convenio.idRecursos == 3)
                    rbtnInfraestructura.Checked = true;
                else if (convenio.idRecursos == 4)
                    rbtnEquipo.Checked = true;
                else if (convenio.idRecursos == 5)
                    rbtnTecnologicos.Checked = true;
                /**/
                txtMonto.Text = convenio.montoRecursoFinanciero.ToString();
                /**/
                if (convenio.propiedadIntelActivo == true)
                    rbtnSiPropInt.Checked = true;
                else if (convenio.propiedadIntelActivo == false)
                    rbtnNoPropInt.Checked = true;
                /**/
                if (!convenio.propiedadIntelDonde.Equals("") || convenio.publicadoDonde.Equals("NULL"))
                    txtPropiedadInt.Text = convenio.propiedadIntelDonde;
                /**/
                txtEntregables.Text = convenio.entregable;
                /**/
                if (convenio.idTipoConvenio == 1)
                    rbtnBilateral.Checked = true;
                else if (convenio.idTipoConvenio == 2)
                    rbtnMultilateral.Checked = true;
                /**/
                if (convenio.idTipoConvenioEsp == 1)
                    rbtnMarco.Checked = true;
                else if (convenio.idTipoConvenioEsp == 2)
                    rbtnEspecifico.Checked = true;
                /**/
                if (convenio.idSector == 1)
                    rbtnPublico.Checked = true;
                else if (convenio.idSector == 2)
                    rbtnPrivado.Checked = true;
                else if (convenio.idSector == 3)
                    rbtnSocial.Checked = true;
                /**/
                if (convenio.idActEcon == 1)
                {
                    rbtnPrimaria.Checked = true;
                    primariaDDL.SelectedValue = convenio.cantidadActEcon.ToString(); ;
                }
                else if (convenio.idActEcon == 2)
                {
                    rbtnSecundaria.Checked = true;
                    secundariaDDL.SelectedValue = convenio.cantidadActEcon.ToString();
                }
                else if (convenio.idActEcon == 3)
                {
                    rbtnTerciaria.Checked = true;
                    terciariaDDL.SelectedValue = convenio.cantidadActEcon.ToString();
                }
                /**/
                if (convenio.idAmbito == 1)
                    rbtnMunicipal.Checked = true;
                else if (convenio.idAmbito == 2)
                    rbtnEstatal.Checked = true;
                else if (convenio.idAmbito == 3)
                    rbtnRegional.Checked = true;
                else if (convenio.idAmbito == 4)
                    rbtnNacional.Checked = true;
                else if (convenio.idAmbito == 5)
                    rbtnInternacional.Checked = true;
                /**/
                if (convenio.eje == "EDUCACION" || convenio.eje == "EDUCACION_")
                    cbxEducacion.Checked = true;
                else if (convenio.eje == "CIENCIA" || convenio.eje == "CIENCIA_")
                    cbxCiencia.Checked = true;
                else if (convenio.eje == "DESARROLLO TECNOLOGICO E INNOVACION" || convenio.eje == "DESARROLLO TECNOLOGICO E INNOVACION_")
                    cbxDesarrollo.Checked = true;
                else if (convenio.eje == "CULTURA" || convenio.eje == "CULTURA_" )
                    cbxCultura.Checked = true;
                else if (convenio.eje == "DEPORTE" || convenio.eje == "DEPORTE_")
                    cbxDeporte.Checked = true;
                else
                {
                    cbxOtro.Checked = true;
                    txtOtro.Text = convenio.eje;
                }
                /**/
                if (convenio.ODSActivo == true)
                {
                    rbtnSiODS.Checked = true;
                    odsDDL.Visible = true;
                }
                else if (convenio.ODSActivo == false)
                    rbtnNoODS.Checked = true;
                /**/
                odsDDL.SelectedValue = convenio.idODS.ToString();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            bool pubbit = rbtnSiMedio.Checked;
            bool propInt = rbtnSiPropInt.Checked;
            bool ods = rbtnSiODS.Checked;
            int? natmod = null;
            int? becmod = null;
            int rec = 2;
            int tipoconv = 2;
            int tipo2 = 2;
            int sector = 1;
            int actecon = 3;
            int acteconnum = 0;
            int ambito = 2;
            int? odsselect;
            String eje = "";
            float? monto = null;
            //Tipo de modalidad
            if (rbtnPresencial.Checked == true)
                natmod = Convert.ToInt32(rbtnPresencial.Value);
            else if (rbtnVirtual.Checked == true)
                natmod = Convert.ToInt32(rbtnVirtual.Value);
            else if (rbtnMixta.Checked == true)
                natmod = Convert.ToInt32(rbtnMixta.Value);
            //tipo modalidad beca
            if (rbtnPresencialBecas.Checked == true)
                becmod = Convert.ToInt32(rbtnPresencialBecas.Value);
            else if (rbtnVirtualBecas.Checked == true)
                becmod = Convert.ToInt32(rbtnVirtualBecas.Value);
            else if (rbtnMixtaBecas.Checked == true)
                becmod = Convert.ToInt32(rbtnMixtaBecas.Value);
            //tipo de recurso
            if (rbtnFinancieros.Checked == true)
                rec = Convert.ToInt32(rbtnFinancieros.Value);
            else if (rbtnHumanos.Checked == true)
                rec = Convert.ToInt32(rbtnHumanos.Value);
            else if (rbtnInfraestructura.Checked == true)
                rec = Convert.ToInt32(rbtnInfraestructura.Value);
            else if (rbtnEquipo.Checked == true)
                rec = Convert.ToInt32(rbtnEquipo.Value);
            else if (rbtnTecnologicos.Checked == true)
                rec = Convert.ToInt32(rbtnTecnologicos.Value);
            //revisar si hay monto
            if (txtMonto.Text.Length != 0)
                monto = float.Parse(txtMonto.Text);
            //revisar tipo convenio
            if (rbtnBilateral.Checked == true)
                tipoconv = Convert.ToInt32(rbtnBilateral.Value);
            else if (rbtnMultilateral.Checked == true)
                tipoconv = Convert.ToInt32(rbtnMultilateral.Value);
            if (rbtnMarco.Checked == true)
                tipo2 = Convert.ToInt32(rbtnMarco.Value);
            else if (rbtnEspecifico.Checked == true)
                tipo2 = Convert.ToInt32(rbtnEspecifico.Value);
            //sector
            if (rbtnPublico.Checked == true)
                sector = Convert.ToInt32(rbtnPublico.Value);
            else if (rbtnPrivado.Checked == true)
                sector = Convert.ToInt32(rbtnPrivado.Value);
            else if (rbtnSocial.Checked == true)
                sector = Convert.ToInt32(rbtnSocial.Value);
            //act econ
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
            //ambito
            if (rbtnMunicipal.Checked == true)
                ambito = Convert.ToInt32(rbtnMunicipal.Value);
            else if (rbtnEstatal.Checked == true)
                ambito = Convert.ToInt32(rbtnEstatal.Value);
            else if (rbtnRegional.Checked == true)
                ambito = Convert.ToInt32(rbtnRegional.Value);
            else if (rbtnNacional.Checked == true)
                ambito = Convert.ToInt32(rbtnNacional.Value);
            else if (rbtnInternacional.Checked == true)
                ambito = Convert.ToInt32(rbtnInternacional.Value);
            //eje
            if (cbxEducacion.Checked == true)
                eje = cbxEducacion.Value + "_";
            if (cbxCiencia.Checked == true)
                eje = cbxCiencia.Value + "_";
            if (cbxDesarrollo.Checked == true)
                eje = eje + cbxDesarrollo.Value + "_";
            if (cbxCultura.Checked == true)
                eje = eje + cbxCultura.Value + "_";
            if (cbxDeporte.Checked == true)
                eje = eje + cbxDeporte.Value + "_";
            if (cbxOtro.Checked == true)
                eje = eje + txtOtro.Text.ToUpper() + "_";
            //ods
            if (ods == false)
                odsselect = null;
            else
                odsselect = Convert.ToInt32(odsDDL.SelectedValue);
            //modificar
            try
            {
                var numCon = Convert.ToInt32(Request.QueryString["NUM"]);
                CONVENIO convenioModificado = ConvenioModelo.BuscarConvenioPorNumero(numCon);
                convenioModificado.nombreInstrumento = NomJurDDL.SelectedValue.ToString();
                convenioModificado.publicadoActivo = pubbit;
                convenioModificado.publicadoDonde = txtMedio.Text.ToUpper();
                convenioModificado.objetivoInstrumento = ObjJurDDL.SelectedValue;
                convenioModificado.idNaturaleza = Convert.ToInt32(NaturalezaDDL.SelectedValue);
                convenioModificado.naturalezaModalidad = natmod;
                convenioModificado.becas = txtBecas.Text.ToUpper();
                convenioModificado.movilidad = becmod;
                convenioModificado.prestacionServicio = txtPrestacion.Text.ToUpper();
                convenioModificado.donacion = txtDonacion.Text.ToUpper();
                convenioModificado.comodato = txtComodato.Text.ToUpper();
                convenioModificado.educacionContinua = txtEducacion.Text.ToUpper();
                convenioModificado.nombreRepITH = txtNombreRepITH.Text.ToUpper();
                convenioModificado.nombreInstitucion = txtNombreInstitucion.Text.ToUpper();
                convenioModificado.nombreRepInstitucion = txtNombreRepInstitucion.Text.ToUpper();
                convenioModificado.cargoRepInstitucion = txtCargoRepInstitucion.Text.ToUpper();
                convenioModificado.idRecursos = rec;
                convenioModificado.montoRecursoFinanciero = monto;
                convenioModificado.propiedadIntelActivo = propInt;
                convenioModificado.propiedadIntelDonde = txtPropiedadInt.Text.ToUpper();
                convenioModificado.entregable = txtEntregables.Text.ToUpper();
                convenioModificado.idTipoConvenio = tipoconv;
                convenioModificado.idTipoConvenioEsp = tipo2;
                convenioModificado.idSector = sector;
                convenioModificado.idActEcon = actecon;
                convenioModificado.cantidadActEcon = acteconnum;
                convenioModificado.idAmbito = ambito;
                convenioModificado.eje = eje;
                convenioModificado.ODSActivo = ods;
                convenioModificado.idODS = odsselect;
                ConvenioModelo.ModificarConvenio(convenioModificado);
                mensaje.Visible = true;
                string javaScript = "OcultarMensaje();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);
                Response.Redirect("Convenio.aspx");
            }
            catch (Exception ex)
            {
                var datos = "<script> alert('" + ex.Message + "') </script>";
            }
        }
        protected void btnAtras_Click(object sender, EventArgs e)
        {
            Response.Redirect("Convenio.aspx");
        }
    }
}

