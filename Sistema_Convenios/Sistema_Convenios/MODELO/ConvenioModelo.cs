using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MODELO
{
    public class ConvenioModelo
    {
        public static void InsertarConvenio(CONVENIO newConvenio)
        {
            /*Inserta un convenio en la BD*/
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                modelo.CONVENIO.Add(newConvenio);
                modelo.SaveChanges();
            }
        }
        public static List<CONVENIO> BuscarConvenioCriterios(string criterios)
        {
            /*Crea una lista con los datos del convenio buscado por algun criterio*/
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                List<CONVENIO> resultado = (from con in modelo.CONVENIO
                where (con.nombreInstrumento.Contains(criterios)
                || con.publicadoDonde.Contains(criterios)
                || con.objetivoInstrumento.Contains(criterios)
                || con.becas.Contains(criterios)
                || con.prestacionServicio.Contains(criterios)
                || con.donacion.Contains(criterios)
                || con.comodato.Contains(criterios)
                || con.educacionContinua.Contains(criterios)
                || con.nombreRepITH.Contains(criterios)
                || con.nombreInstitucion.Contains(criterios)
                || con.nombreRepInstitucion.Contains(criterios)
                || con.cargoRepInstitucion.Contains(criterios)
                || con.propiedadIntelDonde.Contains(criterios)
                || con.entregable.Contains(criterios)
                || con.eje.Contains(criterios)
                || con.plazoConvenio.Contains(criterios)
                ) select con).ToList();
                return resultado;
            }
        }
        public static List<CONVENIO> BuscarConvenioDiasIni(string criterios1, string criterios2)
        {
            var fecha1 = DateTime.Parse(criterios1);
            var fecha2 = DateTime.Parse(criterios2);
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                /*Busca convenio donde el inicio de convenio sea mayor o igual a las fechas establecidas*/
                List<CONVENIO> resultado = (from con in modelo.CONVENIO
                where (con.inicioConvenio >= fecha1 && con.inicioConvenio <= fecha2)
                select con).ToList();
                return resultado;
            }
        }
        public static List<CONVENIO> BuscarConvenioDiasFin(string criterios1, string criterios2)
        {
            var fecha1 = DateTime.Parse(criterios1);
            var fecha2 = DateTime.Parse(criterios2);
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                /*Busca convenio donde el fin de convenio sea mayor o igual a las fechas establecidas*/
                List<CONVENIO> resultado = (from con in modelo.CONVENIO
                where (con.finConvenio >= fecha1 && con.finConvenio <= fecha2)
                select con).ToList();
                return resultado;
            }
        }
        public static List<CONVENIO> BuscarConvenioMesIni(string criterios)
        {
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                /*Busca convenio donde el inicio de convenio sea el mes establecido*/
                List<CONVENIO> resultado = (from con in modelo.CONVENIO
                where (con.inicioConvenio.ToString().Contains(criterios))
                select con).ToList();
                return resultado;
            }
        }
        public static List<CONVENIO> BuscarConvenioMesFin(string criterios)
        {
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                /*Busca convenio donde el fin de convenio sea el mes establecido*/
                List<CONVENIO> resultado = (from con in modelo.CONVENIO
                where (con.finConvenio.ToString().Contains(criterios))
                select con).ToList();
                return resultado;
            }
        }
        public static List<CONVENIO> BuscarConvenioAnioIni(string criterios)
        {
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                /*Busca convenio donde el inicio de convenio sea el año establecido*/
                List<CONVENIO> resultado = (from con in modelo.CONVENIO
                where (con.inicioConvenio.ToString().Contains(criterios))
                select con).ToList();
                return resultado;
            }
        }
        public static List<CONVENIO> BuscarConvenioAnioFin(string criterios)
        {
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                /*Busca convenio donde el fin de convenio sea el mes establecido*/
                List<CONVENIO> resultado = (from con in modelo.CONVENIO
                where (con.finConvenio.ToString().Contains(criterios))
                select con).ToList();
                return resultado;
            }
        }
        public static CONVENIO BuscarConvenioPorNumero(int numConvenio)
        {
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                /*Busca convenio por numero de convenio*/
                var resultado = (from con in modelo.CONVENIO
                                 where con.numConvenio == numConvenio
                                 select con).Single();
                return resultado;
            }
        }
        public static void ModificarFechaConvenio(CONVENIO convenioFechaModificado)
        {
            /*Busca el convenio especifico, cambia fechas y plazo*/
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                CONVENIO convenio = modelo.CONVENIO.Find(convenioFechaModificado.numConvenio);
                convenio.inicioConvenio = convenioFechaModificado.inicioConvenio;
                convenio.finConvenio = convenioFechaModificado.finConvenio;
                convenio.plazoConvenio = convenioFechaModificado.plazoConvenio;
                modelo.SaveChanges();
            }
        }
        public static void ModificarConvenio(CONVENIO convenioModificado)
        {
            /*Busca el convenio especifico, cambia los criterios*/
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                CONVENIO convenio = modelo.CONVENIO.Find(convenioModificado.numConvenio);
                convenio.nombreInstrumento = convenioModificado.nombreInstrumento;
                convenio.publicadoActivo = convenioModificado.publicadoActivo;
                convenio.publicadoDonde = convenioModificado.publicadoDonde;
                convenio.objetivoInstrumento = convenioModificado.objetivoInstrumento;
                convenio.idNaturaleza = convenioModificado.idNaturaleza;
                convenio.naturalezaModalidad = convenioModificado.naturalezaModalidad;
                convenio.becas = convenioModificado.becas;
                convenio.movilidad = convenioModificado.movilidad;
                convenio.prestacionServicio = convenioModificado.prestacionServicio;
                convenio.donacion = convenioModificado.donacion;
                convenio.comodato = convenioModificado.comodato;
                convenio.educacionContinua = convenioModificado.educacionContinua;
                convenio.nombreRepITH = convenioModificado.nombreRepITH;
                convenio.nombreInstitucion = convenioModificado.nombreInstitucion;
                convenio.nombreRepInstitucion = convenioModificado.nombreRepInstitucion;
                convenio.cargoRepInstitucion = convenioModificado.cargoRepInstitucion;
                convenio.idRecursos = convenioModificado.idRecursos;
                convenio.montoRecursoFinanciero = convenioModificado.montoRecursoFinanciero;
                convenio.propiedadIntelActivo = convenioModificado.propiedadIntelActivo;
                convenio.propiedadIntelDonde = convenioModificado.propiedadIntelDonde;
                convenio.entregable = convenioModificado.entregable;
                convenio.idTipoConvenio = convenioModificado.idTipoConvenio;
                convenio.idTipoConvenioEsp = convenioModificado.idTipoConvenioEsp;
                convenio.idSector = convenioModificado.idSector;
                convenio.idActEcon = convenioModificado.idActEcon;
                convenio.cantidadActEcon = convenioModificado.cantidadActEcon;
                convenio.idAmbito = convenioModificado.idAmbito;
                convenio.eje = convenioModificado.eje;
                convenio.ODSActivo = convenioModificado.ODSActivo;
                convenio.idODS = convenioModificado.idODS;
                convenio.num_participantes = convenioModificado.num_participantes;
                modelo.SaveChanges();
            }
        }
        public static void EliminarConvenio(int numConvenio)
        {
            /*Busca el convenio especifico y lo elimina*/
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                var convenio = modelo.CONVENIO.Find(numConvenio);
                modelo.CONVENIO.Remove(convenio);
                modelo.SaveChanges();
            }
        }
    }
}
