using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MODELO
{
    public class UsuarioModelo
    {
        public static void InsertarUsuario(USUARIO newUsuario)
        {   //Agrega un nuevo Usuario mediante entity framework
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                modelo.USUARIO.Add(newUsuario);
                modelo.SaveChanges();
            }
        }

        public static List<USUARIO> BuscarUsuarioCriterios(string criterios)
        {   //Busca y regresa una lista de usuarios con criterios
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                List<USUARIO> resultado =
                    (from us in modelo.USUARIO
                     where (us.nombre.Contains(criterios)
                     || us.primer_apellido.Contains(criterios)
                     || us.segundo_apellido.Contains(criterios)
                     || us.email.Contains(criterios)
                     || us.empresa.Contains(criterios))
                     select us).ToList();
                return resultado;
            }
        }

        public static USUARIO BuscarUsuarioPorID(int idUsuario)
        {   //Regresa el usuario con el id buscado
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                var resultado = (from us in modelo.USUARIO
                                 where us.id_usuario == idUsuario
                                 select us).Single();
                return resultado;
            }
        }

        public static void ModificarUsuario(USUARIO usuarioModificado)
        {   //Busca y modifica el usuario
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                USUARIO usuario = modelo.USUARIO.Find(usuarioModificado.id_usuario);
                usuario.contrasena = usuarioModificado.contrasena;
                usuario.email = usuarioModificado.email;
                usuario.nombre = usuarioModificado.nombre;
                usuario.primer_apellido = usuarioModificado.primer_apellido;
                usuario.segundo_apellido = usuarioModificado.segundo_apellido;
                usuario.telefono = usuarioModificado.telefono;
                usuario.empresa = usuarioModificado.empresa;
                modelo.SaveChanges();
            }
        }
        public static USUARIO IngresarSistema(USUARIO usuario)
        {
            try
            {   //Verifica que usuario y contraseña coincidan para otorgar acceso
                using (var modelo = new SISTEMADECONVENIOSEntities())
                {
                    var resultado = (from us in modelo.USUARIO
                                     where (us.email == usuario.email)
                                     select us).FirstOrDefault();
                    return resultado;
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }

        }

        public static bool ExisteUsuario(string correo)
        {   //Verifica si existe un usuario
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                var resultado = (from us in modelo.USUARIO
                                 where (us.email == correo)
                                 select us);
                return resultado.Count() > 0;
            }
        }

        public static void EliminarUsuario(int idUsuario)
        {   //Elimina un usuario mediante el id
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                var usuario = modelo.USUARIO.Find(idUsuario);
                modelo.USUARIO.Remove(usuario);
                modelo.SaveChanges();
            }
        }
    }
}