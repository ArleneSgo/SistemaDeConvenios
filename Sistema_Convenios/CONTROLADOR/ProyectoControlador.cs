using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MODELO;

namespace CONTROLADOR
{
    public class ProyectoControlador
    {
        public static void InsertarProyecto(PROYECTO newProyecto)
        {
            try
            {   ///Crea un nuevo Proyecto
                ProyectoModelo.InsertarProyecto(newProyecto);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static List<PROYECTO> BuscarProyectoCriterios(string criterios)
        {
            try
            {   ///Devuelve los proyectos con los criterios buscados
                return ProyectoModelo.BuscarProyectoCriterios(criterios);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }
        public static List<TablaProyectos> BuscarTablaProyectoCriterios(string criterios)
        {
            try
            {   ///Devuelve los proyectos con los criterios buscados
                return ProyectoModelo.BuscarTablaProyectoCriterios(criterios);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }
        public static PROYECTO BuscarProyectoPorID(int idProyecto)
        {
            try
            {   ///Devuelve el proyecto perteneciente al ID buscado
                return ProyectoModelo.BuscarProyectoPorID(idProyecto);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }
        public static void ModificarProyecto(PROYECTO proyectoModificado)
        {
            try
            {   ///Verifica que sea un Proyecto válido y que los campos no estne vacios
                if (proyectoModificado.idProyecto > 0 && proyectoModificado.nombreProyecto != string.Empty)
                {
                    ProyectoModelo.ModificarProyecto(proyectoModificado);
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
        public static void EliminarProyecto(int idProyecto)
        {
            try
            {   ///Verifica que el Proyecto que se desea eliminar sea válido
                if (idProyecto > 0)
                {
                    ProyectoModelo.EliminarProyecto(idProyecto);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }
    }
}
