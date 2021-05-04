using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MODELO
{
    public class ParticipanteModelo
    {
        public static void InsertarParticipante(PARTICIPANTE newParticipante)
        {   ///Agrega un nuevo Participante mediante Entity Framework
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                modelo.PARTICIPANTE.Add(newParticipante);
                modelo.SaveChanges();
            }
        }
        public static List<PARTICIPANTE> BuscarParticipanteCriterios(string criterios)
        {   ///Busca y regresa una lista de partcipantes con criterios
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                List<PARTICIPANTE> resultado =
                    (from part in modelo.PARTICIPANTE
                     where (part.nombreProyecto.Contains(criterios))
                     select part).ToList();
                return resultado;
            }
        }
        public static List<PARTICIPANTE> BuscarParticipanteParaElim(int conv)
        {   ///Busca el participante deseado para eliminar
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                List<PARTICIPANTE> resultado =
                    (from part in modelo.PARTICIPANTE
                     where (part.num_convenio == conv)
                     select part).ToList();
                return resultado;
            }
        }
        public static List<TablaParticipantes> BuscarParticipantesCriterios(string criterios)
        {   ///Busca y regresa una lista de participantes con los criterios 
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                List<TablaParticipantes> resultado =
                    (from part in modelo.TablaParticipantes orderby part.num_convenio
                     where (part.nombreInstrumento.Contains(criterios)
                     || part.nombreInstitucion.Contains(criterios)
                     || part.nombreProyecto.Contains(criterios))
                     select part).ToList();
                return resultado;
            }
        }
        public static PARTICIPANTE BuscarParticipantePorID(int idParticipante)
        {   ///Regresa el numero de particpantes con el id buscado
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                var resultado = (from part in modelo.PARTICIPANTE
                                 where part.idTablaParticipante == idParticipante
                                 select part).Single();
                return resultado;
            }
        }
        public static TablaParticipantes BuscarParticipantesPorID(int idConvenio)
        {   ///Regresa el numero de particpantes con el id buscado
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                var resultado = (from part in modelo.TablaParticipantes
                                 where part.numConvenio == idConvenio
                                 select part).Single();
                return resultado;
            }
        }

        public static void ModificarParticipante(PARTICIPANTE participanteModificado)
        {   ///Modifica el participante deseado
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                PARTICIPANTE participante = modelo.PARTICIPANTE.Find(participanteModificado.idTablaParticipante);
                participante.nombreProyecto = participanteModificado.nombreProyecto;
                participante.num_participantes = participanteModificado.num_participantes;
                participante.num_convenio = participanteModificado.num_convenio;
                modelo.SaveChanges();
            }
        }
        public static void EliminarParticipante(int idParticipante)
        {   ///Elimina el participante deseado
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                var participante = modelo.PARTICIPANTE.Find(idParticipante);
                modelo.PARTICIPANTE.Remove(participante);
                modelo.SaveChanges();
            }
        }
    }
}
