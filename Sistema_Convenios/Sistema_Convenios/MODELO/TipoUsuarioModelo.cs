using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MODELO
{
    public class TipoUsuarioModelo
    {
        public static void InsertarTipoUsuario(TIPOUSUARIO newTipoUsuario)
        {
            //Crea un nuevo tipo de usuario usando el entity framework
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                modelo.TIPOUSUARIO.Add(newTipoUsuario);
                modelo.SaveChanges();
            }
        }
        public static List<TIPOUSUARIO> BuscarTipoUsuarioCriterios(string criterios, bool estado)
        {
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                //Devuelve una lista de tipo de usuario con los criterios buscados
                List<TIPOUSUARIO> resultado =
                    (from tus in modelo.TIPOUSUARIO
                     where (tus.descripcion.Contains(criterios)
                      && tus.activo == estado)
                     select tus).ToList();
                return resultado;
            }
        }

        public static TIPOUSUARIO BuscarTipoUsuarioPorID(int idUsuario)
        {
            //Devuelve el tipo de usuario por id buscado
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                var resultado = (from tus in modelo.TIPOUSUARIO
                                 where tus.tipoUsuario1 == idUsuario
                                 select tus).FirstOrDefault();
                return resultado;
            }
        }

        public static void ModificarTipoUsuario(TIPOUSUARIO tipoUsuarioModificado)
        {
            //Busca y modifica el tipo de usuario
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                TIPOUSUARIO tipo = modelo.TIPOUSUARIO.Find(tipoUsuarioModificado.tipoUsuario1);
                tipo.activo = tipoUsuarioModificado.activo;
                tipo.descripcion = tipoUsuarioModificado.descripcion;
                modelo.SaveChanges();
            }
        }

        public static void CambiarEstadoTipoUsuario(int idUsuario)
        {   //Cambia el tipo de usuario dependiendo del estado en el que se encuentre
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                var tipo = modelo.TIPOUSUARIO.Find(idUsuario);
                tipo.activo = tipo.activo == true ? false : true;
                modelo.SaveChanges();
            }
        }
    }
}
