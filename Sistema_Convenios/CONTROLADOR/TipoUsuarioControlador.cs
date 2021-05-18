using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MODELO;

namespace CONTROLADOR
{
    public class TipoUsuarioControlador
    {
        public static void InsertarTipoUsuario(TIPOUSUARIO newtipo)
        {
            try
            {   ///Verifica que el campo requerido no este vacio+
                if (newtipo.descripcion != string.Empty)
                {
                    TipoUsuarioModelo.InsertarTipoUsuario(newtipo);
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

        public static List<TIPOUSUARIO> BuscarTipoUsuarioCriterios(string criterios, bool estado)
        {
            try
            {   ///Devuelve el tipo de usuario que contenga los criterios buscados
                return TipoUsuarioModelo.BuscarTipoUsuarioCriterios(criterios, estado);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static TIPOUSUARIO BuscarTipoUsuarioPorID(int idTipoUsuario)
        {
            try
            {   ///Devuelve el Tipo de Usuario perteneciente al ID buscado
                if (idTipoUsuario > 0)
                {
                    return TipoUsuarioModelo.BuscarTipoUsuarioPorID(idTipoUsuario);
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

        public static void ModificarTipoUsuario(TIPOUSUARIO TipoUsuarioModificado)
        {
            try
            {   ///Modifica un Tipo de Usuario existente
                TipoUsuarioModelo.ModificarTipoUsuario(TipoUsuarioModificado);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static void CambiarEstadoTipoUsuario(int idTipoUsuario)
        {
            try
            {   ///Cambia un Tipo de Usuario existente
                TipoUsuarioModelo.CambiarEstadoTipoUsuario(idTipoUsuario);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }
    }
}