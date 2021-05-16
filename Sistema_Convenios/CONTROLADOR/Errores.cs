using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CONTROLADOR
{
    public class Errores : Exception
    {
        ///Clase reutilizable para controlar errores
        public Errores(string mensaje)
        {
            mensajeError = mensaje;
        }

        private string mensajeError;

        public string MensajeError
        {
            get { return mensajeError; }
            set { mensajeError = value; }
        }
    }
}
