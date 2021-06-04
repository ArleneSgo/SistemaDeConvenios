using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MODELO
{
    public class ProyectoModelo
    {
        public static void InsertarProyecto(PROYECTO newProyecto)
        {   ///Agrega un nuevo Proyecto mediante Entity Framework
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                modelo.PROYECTO.Add(newProyecto);
                modelo.SaveChanges();
            }
        }
        public static List<PROYECTO> BuscarProyectoCriterios(string criterios)
        {   ///Busca y regresa una lista de proyectoS con criterios
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                List<PROYECTO> resultado =
                    (from part in modelo.PROYECTO
                     where (part.nombreProyecto.Contains(criterios))
                     select part).ToList();
                return resultado;
            }
        }
        public static List<TablaProyectos> BuscarTablaProyectoCriterios(string criterios)
        {   ///Busca y regresa una lista de proyectoS con criterios
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                List<TablaProyectos> resultado =
                    (from part in modelo.TablaProyectos
                     where (part.nombreProyecto.Contains(criterios) ||
                     part.nombreInstitucion.Contains(criterios) ||
                     part.nombreInstrumento.Contains(criterios)||
                     part.nombreRepInstitucion.Contains(criterios))
                     select part).ToList();
                return resultado;
            }
        }
        public static List<PROYECTO> BuscarProyectoParaElim(int conv)
        {   ///Busca el proyecto deseado para eliminar
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                List<PROYECTO> resultado =
                    (from part in modelo.PROYECTO
                     where (part.num_convenio == conv)
                     select part).ToList();
                return resultado;
            }
        }
        public static PROYECTO BuscarProyectoPorID(int idProyecto)
        {   ///Regresa Proyecto con el id buscado
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                var resultado = (from part in modelo.PROYECTO
                                 where part.idProyecto == idProyecto
                                 select part).Single();
                return resultado;
            }
        }
        public static void ModificarProyecto(PROYECTO proyectoModificado)
        {   ///Modifica el proyecto deseado
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                PROYECTO proyecto = modelo.PROYECTO.Find(proyectoModificado.idProyecto);
                proyecto.nombreProyecto = proyectoModificado.nombreProyecto;
                proyecto.numParticipantes = proyectoModificado.numParticipantes;
                proyecto.num_convenio = proyectoModificado.num_convenio;
                proyecto.fechaInicio = proyectoModificado.fechaInicio;
                proyecto.fechaFin = proyectoModificado.fechaFin;
                modelo.SaveChanges();
            }
        }
        public static void EliminarProyecto(int idProyecto)
        {   ///Elimina el proyecto deseado
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                var proyecto = modelo.PROYECTO.Find(idProyecto);
                modelo.PROYECTO.Remove(proyecto);
                modelo.SaveChanges();
            }
        }
    }
}
