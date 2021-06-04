using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;
using MODELO;

namespace CONTROLADOR
{
    public class UsuarioControlador
    {
        public static byte[] GenerarSal()
        {
            RNGCryptoServiceProvider rngCsp = new RNGCryptoServiceProvider();
            byte[] salt = new byte[16];
            rngCsp.GetBytes(salt);
            return salt;
        }
        public static byte[] EncriptarContraseña(string password, byte[] salt)
        {
            int iterations = 40000;
            byte[] hash;

            RNGCryptoServiceProvider rngCsp = new RNGCryptoServiceProvider();
            Rfc2898DeriveBytes pbkdf2 = new Rfc2898DeriveBytes(password, salt);
            pbkdf2.IterationCount = iterations;
            hash = pbkdf2.GetBytes(32);
            return hash;
        }
        public static void InsertarUsuario(USUARIO newUsuario)
        {
            try
            {   ///Verifica que no esten vacios los campos requeridos
                if (newUsuario.email != string.Empty && newUsuario.contrasena != string.Empty
                    && newUsuario.nombre != string.Empty && newUsuario.primer_apellido != string.Empty
                    && newUsuario.segundo_apellido != string.Empty && newUsuario.empresa != string.Empty
                    && UsuarioModelo.ExisteUsuario(newUsuario.email) != true)
                {
                    byte[] salt = GenerarSal();
                    newUsuario.contrasena = Convert.ToBase64String(salt) + "!" + Convert.ToBase64String(EncriptarContraseña(newUsuario.contrasena, salt)).Substring(0, 20);
                    UsuarioModelo.InsertarUsuario(newUsuario);
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

        public static List<USUARIO> BuscarUsuarioCriterios(string criterios)
        {
            try
            {  ///Devuelve el Usuario con los criterios buscados
                return UsuarioModelo.BuscarUsuarioCriterios(criterios);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static USUARIO BuscarUsuarioPorID(int idUsuario)
        {
            try
            {   ///Devuelve el Usuario perteneciente al ID buscado
                return UsuarioModelo.BuscarUsuarioPorID(idUsuario);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static void ModificarUsuario(USUARIO usuarioModificado)
        {
            try
            {   ///Verifica que sea un Usuario valido y que no esten vacios los campos reque    ridos
                if (usuarioModificado.id_usuario > 0 && usuarioModificado.nombre != string.Empty
                    && usuarioModificado.primer_apellido != string.Empty && usuarioModificado.segundo_apellido != string.Empty
                    && usuarioModificado.email != string.Empty && usuarioModificado.empresa != string.Empty
                    && usuarioModificado.contrasena != string.Empty)
                {
                    byte[] salt = GenerarSal();
                    usuarioModificado.contrasena = Convert.ToBase64String(salt) + "!" + Convert.ToBase64String(EncriptarContraseña(usuarioModificado.contrasena, salt)).Substring(0, 20);
                    UsuarioModelo.ModificarUsuario(usuarioModificado);
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
        public static void EliminarUsuario(int idUsuario)
        {
            try
            {   ///Verifica que el Usuario sea valido
                if (idUsuario > 0)
                {
                    UsuarioModelo.EliminarUsuario(idUsuario);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static USUARIO IngresarSistema(USUARIO usuario)
        {
            try
            {
                ///Verifica que no este vacios los campos requeridos
                if (usuario.email != string.Empty
                    && usuario.contrasena != string.Empty)
                {
                    var resultado = UsuarioModelo.IngresarSistema(usuario);
                    if (resultado == null)
                    {
                        throw new Errores("Usuario y/o contraseña incorrectos");
                    }

                    string[] contraseña = resultado.contrasena.Split('!');

                    byte[] salt = Convert.FromBase64String(contraseña[0]);
                    byte[] newhash = EncriptarContraseña(usuario.contrasena, salt);

                    if (contraseña[1] == Convert.ToBase64String(newhash).Substring(0, 20))
                    {
                        return resultado;
                    }
                    else
                    {
                        throw new Errores("Usuario y/o contraseña incorrectos");
                    }
                }
                else
                {
                    throw new Errores("Hubo un error");
                }
            }
            catch (Errores ex)
            {
                throw new Errores(ex.MensajeError);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }
    }
}
