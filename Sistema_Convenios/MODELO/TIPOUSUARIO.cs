
//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------


namespace MODELO
{

using System;
    using System.Collections.Generic;
    
public partial class TIPOUSUARIO
{

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public TIPOUSUARIO()
    {

        this.USUARIO = new HashSet<USUARIO>();

    }


    public int tipoUsuario1 { get; set; }

    public string descripcion { get; set; }

    public bool activo { get; set; }



    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<USUARIO> USUARIO { get; set; }

}

}
