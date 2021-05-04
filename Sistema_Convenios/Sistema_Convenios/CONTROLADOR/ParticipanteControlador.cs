using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MODELO;

namespace CONTROLADOR
{
    public class ParticipanteControlador
    {
        public static void InsertarParticipante(PARTICIPANTE newParticipante)
        {
            try
            {   //Crea un nuevo Participante
                ParticipanteModelo.InsertarParticipante(newParticipante);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static List<PARTICIPANTE> BuscarParticipanteCriterios(string criterios)
        {
            try
            {   //Devuelve Número de participantes con los criterios buscados
                return ParticipanteModelo.BuscarParticipanteCriterios(criterios);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static List<TablaParticipantes> BuscarParticipantesCriterios(string criterios)
        {
            try
            {   //Devuelve Número de participantes con los criterios buscados
                return ParticipanteModelo.BuscarParticipantesCriterios(criterios);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }
        public static PARTICIPANTE BuscarParticipantePorID(int idParticipante)
        {
            try
            {   //Devuelve número de  participantes perteneciente al ID buscado
                return ParticipanteModelo.BuscarParticipantePorID(idParticipante);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }
        public static TablaParticipantes BuscarParticipantesPorID(int idConvenio)
        {
            try
            {   //Devuelve número de  participantes perteneciente al ID buscado
                return ParticipanteModelo.BuscarParticipantesPorID(idConvenio);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static void ModificarParticipante(PARTICIPANTE participanteModificado)
        {
            try
            {   //Verifica que sea un PArticipante válido y que los campos no estne vacios
                if (participanteModificado.idTablaParticipante > 0 && participanteModificado.nombreProyecto != string.Empty)
                {
                    ParticipanteModelo.ModificarParticipante(participanteModificado);
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
        public static void EliminarParticipante(int idParticipante)
        {
            try
            {   //Verifica que el Participante que se desea eliminar sea válido
                if (idParticipante > 0)
                {
                    ParticipanteModelo.EliminarParticipante(idParticipante);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }
    }
}
