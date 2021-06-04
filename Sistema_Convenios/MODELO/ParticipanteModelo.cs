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
                    (from part in modelo.TablaParticipantesSet
                     orderby part.num_convenio
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
                var resultado = (from part in modelo.PARTICIPANTE.Include("PARTICIPANTE_CARRERA")
                                 where part.idTablaParticipante == idParticipante
                                 select part).Single();
                return resultado;
            }
        }
        public static TablaParticipantes BuscarParticipantesPorID(int idConvenio)
        {   ///Regresa el numero de particpantes con el id buscado
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                var resultado = (from part in modelo.TablaParticipantesSet.Include("PARTICIPANTE_CARRERA")
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
                participante.semestre = participanteModificado.semestre;
                if (participante.PARTICIPANTE_CARRERA.Count > 0)
                {
                    foreach (var pc_m in participanteModificado.PARTICIPANTE_CARRERA)
                    {
                        bool found = false;
                        foreach (var pc in participante.PARTICIPANTE_CARRERA)
                        {
                            if (pc.idParticipanteCarrera == pc_m.idParticipanteCarrera)
                            {
                                pc.nombreAlumno = pc_m.nombreAlumno;
                                pc.nombreCarrera = pc_m.nombreCarrera;
                                found = true;
                                break;
                            }
                        }
                        if (!found)
                        {
                            participante.PARTICIPANTE_CARRERA.Add(new PARTICIPANTE_CARRERA()
                            {
                                nombreAlumno = pc_m.nombreAlumno,
                                nombreCarrera = pc_m.nombreCarrera
                            });
                        }
                    }

                    int difference = participante.PARTICIPANTE_CARRERA.Count - (int)participanteModificado.num_participantes;
                    if (difference > 0)
                    {
                        foreach (var pc in participante.PARTICIPANTE_CARRERA.ToList().GetRange(participante.PARTICIPANTE_CARRERA.Count - difference - 1, difference))
                        {
                            modelo.PARTICIPANTE_CARRERA.Remove(pc);
                        }
                    }
                }
                else
                {
                    participante.PARTICIPANTE_CARRERA = participanteModificado.PARTICIPANTE_CARRERA;
                }
                modelo.SaveChanges();
            }
        }
        public static void EliminarParticipante(int idParticipante)
        {   ///Elimina el participante deseado
            using (var modelo = new SISTEMADECONVENIOSEntities())
            {
                var participante = modelo.PARTICIPANTE.Find(idParticipante);
                foreach (var pc in participante.PARTICIPANTE_CARRERA.ToList())
                {
                    modelo.PARTICIPANTE_CARRERA.Remove(pc);
                }
                modelo.PARTICIPANTE.Remove(participante);
                modelo.SaveChanges();
            }
        }

    }
}