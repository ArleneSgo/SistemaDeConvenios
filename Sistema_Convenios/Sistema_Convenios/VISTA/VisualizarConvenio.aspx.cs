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
    public partial class VisualizarConvenio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {   //Busca el convenio y carga sus valores para su visualizacion
                var numCon = Convert.ToInt32(Request.QueryString["NUM"]);
                CONVENIO convenio = ConvenioModelo.BuscarConvenioPorNumero(numCon);
                lblNomInsJur.Text = convenio.nombreInstrumento;
                lblFechaIni.Text = convenio.inicioConvenio.ToString();
                lblFechaFin.Text = convenio.finConvenio.ToString();
                lblPlazo.Text = convenio.plazoConvenio;
                if (convenio.publicadoActivo == true)
                {
                    lblmedio.Text = "SI";
                    lblcualmedio.Text = convenio.publicadoDonde;
                }
                else
                {
                    lblmedio.Text = "NO";
                }
                lblObjInsJur.Text = convenio.objetivoInstrumento;
                if (convenio.idNaturaleza == 1)
                {
                    lblNaturaleza.Text = "SERVICIO SOCIAL";
                }
                else if (convenio.idNaturaleza == 2)
                {
                    lblNaturaleza.Text = "RESIDENCIAS PROFESIONALES";
                }
                else
                {
                    lblNaturaleza.Text = "EDUCACION DUAL";
                }
                if (convenio.naturalezaModalidad == 1)
                {
                    lblNaturMod.Text = "PRESENCIAL";
                }
                else if (convenio.naturalezaModalidad == 2)
                {
                    lblNaturMod.Text = "VIRTUAL";
                }
                else
                {
                    lblNaturMod.Text = "MIXTA";
                }
                lblBecas.Text = convenio.becas;
                if (convenio.movilidad == 1)
                {
                    lblBecaMod.Text = "PRESENCIAL";
                }
                else if (convenio.movilidad == 2)
                {
                    lblBecaMod.Text = "VIRTUAL";
                }
                else if (convenio.movilidad == 3)
                {
                    lblBecaMod.Text = "MIXTA";
                }
                lblPrestacion.Text = convenio.prestacionServicio;
                lblDonacion.Text = convenio.donacion;
                lblComodato.Text = convenio.comodato;
                lblEducacion.Text = convenio.educacionContinua;
                lblNomRepIT.Text = convenio.nombreRepITH;
                lblNombreInst.Text = convenio.nombreInstitucion;
                lblNomRepIns.Text = convenio.nombreRepInstitucion;
                lblCargoRep.Text = convenio.cargoRepInstitucion;
                if (convenio.idRecursos == 1)
                {
                    lblRecurso.Text = "FINANCIEROS";
                    lblMonto.Text = convenio.montoRecursoFinanciero.ToString();
                }
                else if (convenio.idRecursos == 2)
                {
                    lblRecurso.Text = "HUMANOS";
                }
                else if (convenio.idRecursos == 3)
                {
                    lblRecurso.Text = "INFRAESTRUCTURA";
                }
                else if (convenio.idRecursos == 4)
                {
                    lblRecurso.Text = "EQUIPO";
                }
                else
                {
                    lblRecurso.Text = "TECNOLÓGICOS";
                }
                if (convenio.propiedadIntelActivo == true)
                {
                    lblpropInt.Text = "SI";
                    lblPropIntCual.Text = convenio.propiedadIntelDonde;
                }
                else
                {
                    lblpropInt.Text = "NO";
                }
                lblEntregables.Text = convenio.entregable;
                if (convenio.idTipoConvenio == 1)
                {
                    lblTipo1.Text = "BILATERAL";
                }
                else
                {
                    lblTipo1.Text = "MULTILATERAL";
                }
                if (convenio.idTipoConvenioEsp == 1)
                {
                    lblTipo2.Text = "MARCO";
                }
                else
                {
                    lblTipo2.Text = "ESPECIFICO";
                }
                if (convenio.idSector == 1)
                {
                    lblSector.Text = "PÚBLICO";
                }
                else if (convenio.idSector == 2)
                {
                    lblSector.Text = "PRIVADO";
                }
                else
                {
                    lblSector.Text = "SOCIAL";
                }
                if (convenio.idActEcon == 1)
                {
                    lblActEcon.Text = "PRIMARIA";
                }
                else if (convenio.idActEcon == 2)
                {
                    lblActEcon.Text = "SECUNDARIA";
                }
                else
                {
                    lblActEcon.Text = "TERCIARIA";
                }
                if (convenio.cantidadActEcon == 11)
                {
                    lblActEconNum.Text = "11 AGRICULTURA, CRÍA Y EXPLOTACIÓN DE ANIMALES, APROVECHAMIENTO FORESTAL, PESCA Y CAZA";
                }
                else if (convenio.cantidadActEcon == 21)
                {
                    lblActEconNum.Text = "21 MINERÍA";
                }
                else if (convenio.cantidadActEcon == 22)
                {
                    lblActEconNum.Text = "22 GENERACION, TRANSMISION Y DISTRIBUCION DE ENERGIA ELECTRICA, AGUA Y SUMINISTRO DE GAS POR DUCTOS AL CONSUMIDOR FINAL";
                }
                else if (convenio.cantidadActEcon == 23)
                {
                    lblActEconNum.Text = "23 CONSTRUCCIÓN";
                }
                else if (convenio.cantidadActEcon == 31)
                {
                    lblActEconNum.Text = "31-33 INDUSTRIAS MANUFACTURERAS";
                }
                else if (convenio.cantidadActEcon == 43)
                {
                    lblActEconNum.Text = "43 COMERCIO AL POR MAYOR";
                }
                else if (convenio.cantidadActEcon == 46)
                {
                    lblActEconNum.Text = "46 COMERCIO AL POR MENOR";
                }
                else if (convenio.cantidadActEcon == 48)
                {
                    lblActEconNum.Text = "48-49 TRANSPORTES CORREOS Y ALMACENAMIENTO";
                }
                else if (convenio.cantidadActEcon == 51)
                {
                    lblActEconNum.Text = "51 INFORMACIÓN EN MEDIOS MASIVOS";
                }
                else if (convenio.cantidadActEcon == 52)
                {
                    lblActEconNum.Text = "52 SERVICIOS FINANCIEROS Y DE SEGUROS";
                }
                else if (convenio.cantidadActEcon == 53)
                {
                    lblActEconNum.Text = "53 SERVICIOS INMOBILIARIOS Y DE ALQUILER DE BIENES MUEBLES E INTANGIBLES";
                }
                else if (convenio.cantidadActEcon == 54)
                {
                    lblActEconNum.Text = "54 SERVICIOS PROFESIONALES CIENTIFICOS Y TECNICOS";
                }
                else if (convenio.cantidadActEcon == 55)
                {
                    lblActEconNum.Text = "55 CORPORATIVO";
                }
                else if (convenio.cantidadActEcon == 56)
                {
                    lblActEconNum.Text = "56 SERVICIOS DE APOYO A LOS NEGOCIOS Y MANEJO DE DESECHOS Y SERVICIOS DE REMEDIACION";
                }
                else if (convenio.cantidadActEcon == 61)
                {
                    lblActEconNum.Text = "61 SERVICIOS EDUCATIVOS";
                }
                else if (convenio.cantidadActEcon == 62)
                {
                    lblActEconNum.Text = "62 SERVICIOS DE SALUD Y DE ASISTENCIA SOCIAL";
                }
                else if (convenio.cantidadActEcon == 71)
                {
                    lblActEconNum.Text = "71 SERVICIOS DE ESPARCIAMIENTO CULTURALES Y DEPORTIVOS, Y OTROS SERVICIOS RECREATIVOS";
                }
                else if (convenio.cantidadActEcon == 72)
                {
                    lblActEconNum.Text = "72 SERVICIOS DE ALOJAMIENTO TEMPORAL Y DE PREPARACION DE ALIMENTOS Y BEBIDAS";
                }
                else if (convenio.cantidadActEcon == 81)
                {
                    lblActEconNum.Text = "81 OTROS SERVICIOS EXCEPTO ACTIVIDADES GUBERNAMENTALES";
                }
                if (convenio.idAmbito == 1)
                {
                    lblAmbito.Text = "MUNICIPAL";
                }
                else if (convenio.idAmbito == 2)
                {
                    lblAmbito.Text = "ESTATAL";
                }
                else if (convenio.idAmbito == 3)
                {
                    lblAmbito.Text = "REGIONAL";
                }
                else if (convenio.idAmbito == 4)
                {
                    lblAmbito.Text = "NACIONAL";
                }
                else if (convenio.idAmbito == 5)
                {
                    lblAmbito.Text = "INTERNACIONAL";
                }
                lblEje.Text = convenio.eje;
                if (convenio.ODSActivo == true)
                {
                    lblAlineadoODS.Text = "SI";
                }
                else
                {
                    lblAlineadoODS.Text = "NO";
                }
                if (convenio.idODS == 1)
                {
                    lblODS.Text = "FIN DE POBREZA";
                }
                else if (convenio.idODS == 2)
                {
                    lblODS.Text = "HAMBRE CERO";
                }
                else if (convenio.idODS == 3)
                {
                    lblODS.Text = "SALUD Y BIENESTAR";
                }
                else if (convenio.idODS == 4)
                {
                    lblODS.Text = "EDUCACIÓN DE CALIDAD";
                }
                else if (convenio.idODS == 5)
                {
                    lblODS.Text = "IGUALDAD DE GÉNERO";

                }
                else if (convenio.idODS == 6)
                {
                    lblODS.Text = "AGUA LIMPIA Y SANEAMIENTO";
                }
                else if (convenio.idODS == 7)
                {
                    lblODS.Text = "ENERGIA ASEQUIBLE Y NO CONTAMINANTE";
                }
                else if (convenio.idODS == 8)
                {
                    lblODS.Text = "TRABAJO DECENTE Y CRECIMIENTO ECONÓMICO";
                }
                else if (convenio.idODS == 9)
                {
                    lblODS.Text = "INDUSTRIA, INNOVACIÓN E INFRAESTRUCTURA";
                }
                else if (convenio.idODS == 10)
                {
                    lblODS.Text = "REDUCCIÓN DE LAS DESIGUALDADES";
                }
                else if (convenio.idODS == 11)
                {
                    lblODS.Text = "CIUDADES Y COMUNIDADES SOSTENIBLES";
                }
                else if (convenio.idODS == 12)
                {
                    lblODS.Text = "PRODUCCIÓN Y CONSUMO RESPONSABLES";
                }
                else if (convenio.idODS == 13)
                {
                    lblODS.Text = "ACCIÓN POR EL CLIMA";
                }
                else if (convenio.idODS == 14)
                {
                    lblODS.Text = "VIDA SUBMARINA";
                }
                else if (convenio.idODS == 15)
                {
                    lblODS.Text = "VIDA DE ECOSISTEMAS TERRESTRES";
                }
                else if (convenio.idODS == 16)
                {
                    lblODS.Text = "PAZ, JUSTICIA E INSTITUCIONES SÓLIDAS";
                }
                else if (convenio.idODS == 17)
                {
                    lblODS.Text = "ALIANZAS PARA LOGRAR LOS OBJETIVOS";
                }
            }
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {   //Regresa a la pantalla del grid de convenios
            Response.Redirect("buscarConvenio.aspx");
        }
    }
}