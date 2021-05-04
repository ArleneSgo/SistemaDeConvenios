using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MODELO;

namespace CONTROLADOR
{
    public class ConvenioControlador
    {
        public static void InsertarConvenio(CONVENIO newConvenio)
        {
            try
            {   ///Verifica que los campos requeridos no esten vacios
                if (newConvenio.nombreInstrumento != string.Empty && newConvenio.plazoConvenio 
                    != string.Empty && newConvenio.objetivoInstrumento != string.Empty &&
                    newConvenio.nombreRepITH != string.Empty && newConvenio.nombreInstitucion 
                    != string.Empty && newConvenio.nombreRepInstitucion != string.Empty &&
                    newConvenio.cargoRepInstitucion != string.Empty)
                {
                    ConvenioModelo.InsertarConvenio(newConvenio);
                }
                else
                {
                    throw new Exception("Hubo un error");
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }
        public static List<CONVENIO> BuscarConvenioCriterios(string criterios)
        {
            try
            {
                ///Devuelve convenio con los criterios buscados
                return ConvenioModelo.BuscarConvenioCriterios(criterios);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }
        public static CONVENIO BuscarConvenioPorNumero(int numConvenio)
        {
            try
            {
                ///Verifica que el convenio sea un numero positivo
                if (numConvenio > 0)
                {
                    return ConvenioModelo.BuscarConvenioPorNumero(numConvenio);
                }
                else
                {
                    throw new Exception("Hubo un error");
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static void ModificarFechaConvenio(CONVENIO convenioFechaModificado)
        {
            try
            {
                ///Modifica la fecha del convenio especifico
                ConvenioModelo.ModificarFechaConvenio(convenioFechaModificado);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }
        public static void ModificarConvenio(CONVENIO convenioModificado)
        {
            try
            {
                ///Modifica el convenio especifico
                ConvenioModelo.ModificarConvenio(convenioModificado);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }
        public static void EliminarConvenio(int numConvenio)
        {
            try
            {
                ///Elimina el convenio especifico
                ConvenioModelo.EliminarConvenio(numConvenio);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

    }
}
