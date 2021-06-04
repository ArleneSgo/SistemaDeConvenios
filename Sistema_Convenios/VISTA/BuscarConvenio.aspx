<%@ Page Title="" Language="C#" MasterPageFile="~/PagMaestra.Master" AutoEventWireup="true" CodeBehind="BuscarConvenio.aspx.cs" Inherits="VISTA.BuscarConvenio" %>
<%@ import Namespace="MODELO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Titulos" runat="server">
  <h1 class="display-4 mb-2 mx-auto text-center" style="color:aliceblue">Buscar Convenio</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="p-4 m-4 border-top-0">
    <div class="input-group input-group-lg mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text" id="inputGroup-sizing-xsm">Buscar</span>
      </div>
        <asp:TextBox runat="server" ID="txtCriterios" CssClass="form-control" aria-label="Medium" aria-describedby="inputGroup-sizing-md" 
        OnTextChanged="txtCriterios_TextChanged"/>
      </div>
      <asp:Button ID="btnBuscar" Text="Buscar" CssClass="btn btn-primary mt-1" runat="server" OnClick="btnBuscar_Click" />
      <button id="btnFiltro" class="btn btn-primary mt-1" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false"
      aria-controls="collapseExample">Filtrar</button>
      <asp:Button ID="btnExpExcel" Text="Exportar a Excel" CssClass="btn btn-success mt-1" runat="server" OnClick="btnExportar_Click" />
      <div class="collapse row" id="collapseExample">
        <div class="card card-body col-md-6">
            Busqueda por fechas: <br>
          <label class="radio-inline"><input type="radio" name="optradio1" id="rbtnInic" value="1" runat="server" onclick="ShowHideDiv();">
          &nbsp Buscar por fechas de Inicio &nbsp&nbsp&nbsp&nbsp</label>
          <label class="radio-inline"><input type="radio" name="optradio1" id="rbtnFin" value="2" runat="server" onclick="ShowHideDiv();">
          &nbsp Buscar por fechas de Fin &nbsp&nbsp&nbsp&nbsp</label>
          <div id="rbtnlist" Visible="false">
            <label class="radio-inline"><input type="radio" name="optradio" id="rbtnDia" value="1" onclick="ShowHideDiv1();">
            &nbsp Por Día &nbsp&nbsp&nbsp&nbsp</label>
            <label class="radio-inline"><input type="radio" name="optradio" id="rbtnMes" value="2" onclick="ShowHideDiv2();">
            &nbsp Por Mes &nbsp&nbsp&nbsp&nbsp </label>
            <label class="radio-inline"><input type="radio" name="optradio" id="rbtnAnio" value="3" onclick="ShowHideDiv3();">
            &nbsp Por Año &nbsp&nbsp&nbsp&nbsp </label>
          </div>
          <div id="fechaDia" style="display:none">
            <label>De:</label>
            <asp:TextBox ID="dia1" runat="server" TextMode="Date"></asp:TextBox>
            <label>A:</label>
            <asp:TextBox ID="dia2" runat="server" TextMode="Date"></asp:TextBox>
            <asp:Button ID="btnAplicar1" Text="Aplicar" CssClass="btn btn-primary mt-1" runat="server" OnClick="btnAplicar1_Click"/>
          </div>
          <div id="fechaMes" style="display:none">
            <label>Mes:</label>
            <asp:TextBox ID="mes" runat="server" TextMode="Month"></asp:TextBox>
            <asp:Button ID="btnAplicar2" Text="Aplicar" CssClass="btn btn-primary mt-1" runat="server" OnClick="btnAplicar2_Click"/>
          </div>
          <div id="fechaAnio" style="display:none">
            <label>Año:</label>
            <asp:TextBox ID="year" runat="server" TextMode="Number" placeholder="Ingrese año" MaxLength="4"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ErrorMessage="* Formato Incorrecto, se esperan 4 digitos" ControlToValidate="year" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]\w{3}"></asp:RegularExpressionValidator>
            <asp:Button ID="btnAplicar3" Text="Aplicar" CssClass="btn btn-primary mt-1" runat="server" OnClick="btnAplicar3_Click"/>
          </div>
        </div>
        <div class="card card-body col-md-6">
            Por Instrumento Jurídico:
              <asp:DropDownList ID="ObjJurDDL" runat="server">
                <asp:ListItem Value="">Seleccionar</asp:ListItem>
                <asp:ListItem Value="SERVICIO SOCIAL">SERVICIO SOCIAL</asp:ListItem>
                <asp:ListItem Value="RESIDENCIAS">RESIDENCIAS</asp:ListItem>
                <asp:ListItem Value="CONVENIO MARCO">CONVENIO MARCO</asp:ListItem>
              </asp:DropDownList><br />
            Por Sector:
              <asp:DropDownList ID="SectorDDL" runat="server">
                <asp:ListItem Value="">Seleccionar</asp:ListItem>
                <asp:ListItem Value="Público">Público</asp:ListItem>
                <asp:ListItem Value="Privado">Privado</asp:ListItem>
                <asp:ListItem Value="Social">Social</asp:ListItem>
              </asp:DropDownList><br />
            Por Ámbito:
              <asp:DropDownList ID="AmbitoDDL" runat="server">
                <asp:ListItem Value="">Seleccionar</asp:ListItem>
                <asp:ListItem Value="Municipal">Municipal</asp:ListItem>
                <asp:ListItem Value="Estatal">Estatal</asp:ListItem>
                <asp:ListItem Value="Regional">Regional</asp:ListItem>
                <asp:ListItem Value="Nacional">Nacional</asp:ListItem>
                <asp:ListItem Value="Internacional">Internacional</asp:ListItem>
              </asp:DropDownList>
            <asp:Button ID="btnAplicar4" Text="Aplicar" CssClass="btn btn-primary mt-1" runat="server" OnClick="btnAplicar4_Click"/>

        </div>
      </div>

   <script type="text/javascript">
       /* busca convenio sefundia */
       function ShowHideDiv1() {
           var rbtnD = document.getElementById("rbtnDia");
           var fecDia = document.getElementById("fechaDia");
           var fecMes = document.getElementById("fechaMes");
           var fecAnio = document.getElementById("fechaAnio");
           fecDia.style.display = rbtnD.checked ? "block" : "none";
           fecMes.style.display = "none";
           fecAnio.style.display = "none";
       }
   </script>

    <script type="text/javascript">
        /*busca convenio segun mes */
        function ShowHideDiv2() {
            var rbtnD = document.getElementById("rbtnMes");
            var fecDia = document.getElementById("fechaDia");
            var fecMes = document.getElementById("fechaMes");
            var fecAnio = document.getElementById("fechaAnio");
            fecMes.style.display = rbtnD.checked ? "block" : "none";
            fecDia.style.display = "none";
            fecAnio.style.display = "none";
        }
    </script>

    <script type="text/javascript">
        /*busca convenio segun año*/
        function ShowHideDiv3() {
            var rbtnD = document.getElementById("rbtnAnio");
            var fecDia = document.getElementById("fechaDia");
            var fecMes = document.getElementById("fechaMes");
            var fecAnio = document.getElementById("fechaAnio");
            fecAnio.style.display = rbtnD.checked ? "block" : "none";
            fecDia.style.display = "none";
            fecMes.style.display = "none";
        }
    </script>

    <div class="mt-3">
      <div style="overflow-x:auto;width:100%">
        <asp:GridView ID="gvBuscarConvenios" CssClass="table table-bordered dataTable" AutoGenerateColumns="False" runat="server">
          <Columns>
            <asp:BoundField DataField="numConvenio" HeaderText="Numero del Convenio" />
            <asp:BoundField DataField="nombreInstrumento" HeaderText="Nombre del Instrumento Jurídico" />
            <asp:TemplateField HeaderText="Vigencia del Instrumento Jurídico / Inicio">
            <ItemTemplate>
              <asp:Label ID="lblFechaIni" runat="server" Text='<%# Eval("inicioConvenio", "{0:dd, MMM yyyy}")%>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Vigencia del Instrumento Jurídico / Fin">
            <ItemTemplate>    
              <asp:Label ID="lblFechaFin" runat="server" Text='<%# Eval("finConvenio", "{0:dd, MMM yyyy}")%>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Vigencia del Instrumento Jurídico / Plazo en meses">
            <ItemTemplate>
              <asp:Label ID="lblPlazo" runat="server" Text='<%# Eval("plazoConvenio")%>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Se encuentra publicado en algún medio">
            <ItemTemplate>
              <asp:Label ID="lblPublicado" runat="server" Text='<%# string.Format("{0}", Eval("publicadoActivo").ToString() == "True" ? "SI" : "NO")%>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>
          <asp:BoundField DataField="publicadoDonde" HeaderText="Medio en el que se encuentra publicado" NullDisplayText=" " /> 
          <asp:BoundField DataField="objetivoInstrumento" HeaderText="Objeto u objetivo del Instrumento Jurídico" />
          <asp:TemplateField HeaderText="Naturaleza">
            <ItemTemplate>
              <asp:Label ID="lblNaturaleza" runat="server" Text='<%# string.Format("{0}", Eval("idNaturaleza").ToString() == "1" ? "SERVICIO SOCIAL" : Eval("idNaturaleza").ToString() == "2" ? "RESIDENCIAS PROFESIONALES" : "EDUCACION DUAL")%>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Modalidad de Naturaleza">
            <ItemTemplate>
              <asp:Label ID="lblNatMod" runat="server" Text='<%# string.Format("{0}",Eval("movilidad") == null ? " ": Eval("naturalezaModalidad").ToString() == "1" ? "PRESENCIAL" : Eval("naturalezaModalidad").ToString() == "2" ? "VIRTUAL" : Eval("naturalezaModalidad").ToString()=="3" ? "MIXTA":"")%>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>
          <asp:BoundField DataField="becas" HeaderText="Becas" NullDisplayText=" "/>
          <asp:TemplateField HeaderText="Movilidad/Intercambio">
            <ItemTemplate>
              <asp:Label ID="lblbecMod" runat="server" Text='<%# string.Format("{0}", Eval("movilidad") == null ? " " : Eval("movilidad").ToString() == "1" ? "PRESENCIAL" : Eval("movilidad").ToString() == "2" ? "VIRTUAL" : "MIXTA")%>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>
          <asp:BoundField DataField="prestacionServicio" HeaderText="Prestación de Servicios"/>
          <asp:BoundField DataField="donacion" HeaderText="Donación"/>
          <asp:BoundField DataField="comodato" HeaderText="Comodato"/>
          <asp:BoundField DataField="educacionContinua" HeaderText="Educación Continua"/>
          <asp:BoundField DataField="nombreRepITH" HeaderText="Nombre del Representante del IT que suscribió el instrumento jurídico" />
          <asp:BoundField DataField="nombreInstitucion" HeaderText="Nombre de la(s) Institucion(es) con la que se suscribe el instrumento jurídico" />
          <asp:BoundField DataField="nombreRepInstitucion" HeaderText="Nombre del Representante de la Institución con la que se suscribe el instrumento jurídico" />
          <asp:BoundField DataField="cargoRepInstitucion" HeaderText="Cargo del Representante de la Institución con la que se suscribe el instrumento jurídico" />
          <asp:TemplateField HeaderText="La suscripción del instrumento jurídico implica el uso de recursos">
            <ItemTemplate>
              <asp:Label ID="lblrecursos" runat="server" Text='<%# string.Format("{0} {1}", Eval("idRecursos").ToString() == "1" ? "FINANCIEROS" : Eval("idRecursos").ToString() == "2" ? "HUMANOS" : Eval("idRecursos").ToString() == "3" ? "INFRAESTRUCTURA" : Eval("idRecursos").ToString() == "4" ? "EQUIPO" : "TECNOLOGICOS", Eval("montoRecursoFinanciero")) %>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Involucra algun aspecto de Propiedad Intelactual">
            <ItemTemplate>
              <asp:Label ID="lblPropInt" runat="server" Text='<%# string.Format("{0}", Eval("propiedadIntelActivo").ToString() == "True" ? "SI" : "NO")%>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>
          <asp:BoundField DataField="propiedadIntelDonde" HeaderText="Propiedad Intelectual" NullDisplayText=" "/>
          <asp:BoundField DataField="entregable" HeaderText="Entregables" />
          <asp:TemplateField HeaderText="Tipo de Convenio">
            <ItemTemplate>
              <asp:Label ID="lblTipConv" runat="server" Text='<%# string.Format("{0} {1}", Eval("idTipoConvenio").ToString() == "1" ? "BILATERAL" : "MULTILATERAL", Eval("idTipoConvenioEsp").ToString() == "1" ? "MARCO" : "ESPECIFICO") %>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Sector">
            <ItemTemplate>
              <asp:Label ID="lblSector" runat="server" Text='<%# string.Format("{0}", Eval("idSector").ToString() == "1" ? "PUBLICO" : Eval("idSector").ToString() == "2" ? "PRIVADO" : "SOCIAL")%>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Actividad Económica">
            <ItemTemplate>
              <asp:Label ID="lblActEcon" runat="server" Text='<%# string.Format("{0} {1}", Eval("idActEcon").ToString() == "1" ? "PRIMARIA" : Eval("idActEcon").ToString() == "2" ? "SECUNDARIA" : "TERCIARIA", Eval("cantidadActEcon").ToString() == "11" ? "11. AGRICULTURA, CRÍA Y EXPLOTACIÓN DE ANIMALES, APROVECHAMIENTO FORESTAL, PESCA Y CAZA" : 
                Eval("cantidadActEcon").ToString() == "21" ? "21. MINERÍA" : Eval("cantidadActEcon").ToString() == "22" ? "22. GENERACIÓN, TRANSMISIÓN Y DISTRIBUCIÓN DE ENERGÍA ELÉCTRICA, AGUA Y SUMINISTRO DE GAS POR DUCTOS AL CONSUMIDOR FINAL" : Eval("cantidadActEcon").ToString() == "23" ? "23. CONSTRUCCIÓN" : 
                Eval("cantidadActEcon").ToString() == "31" ? "31-33. INDUSTRIAS MANUFACTURERAS" : Eval("cantidadActEcon").ToString() == "43" ? "43. COMERCIO AL POR MAYOR" : Eval("cantidadActEcon").ToString() == "46" ? "46. COMERCIO AL POR MENOR" : Eval("cantidadActEcon").ToString() == "48" ? "	48-49. TRANSPORTES CORREOS Y ALMACENAMIENTO" :
                Eval("cantidadActEcon").ToString() == "51" ? "51. INFORMACIÓN EN MEDIOS MASIVOS" : Eval("cantidadActEcon").ToString() == "52" ? "52. SERVICIOS FINANCIEROS Y DE SEGUROS" : Eval("cantidadActEcon").ToString() == "53" ? "53. SERVICIOS INMOBILIARIOS Y DE ALQUILER DE BIENES MUEBLES E INTANGIBLES" :
                Eval("cantidadActEcon").ToString() == "54" ? "54. SERVICIOS PROFESIONALES CIENTÍFICOS Y TÉCNICOS" : Eval("cantidadActEcon").ToString() == "55" ? "55. CORPORATIVOS" : Eval("cantidadActEcon").ToString() == "56" ? "56. SERVICIOS DE APOYO A LOS NEGOCIOS Y MANEJO DE DESECHOS Y SERVICIOS DE REMEDIACIÓN" :
                Eval("cantidadActEcon").ToString() == "61" ? "61. SERVICIOS EDUCATIVOS" : Eval("cantidadActEcon").ToString() == "62" ? "62. SERVICIOS DE SALUD Y DE ASISTENCIA SOCIAL" : Eval("cantidadActEcon").ToString() == "71" ? "71. SERVICIOS DE ESPARCIAMIENTO CULTURALES Y DEPORTIVOS, Y OTROS SERVICIOS RECREATIVOS" :
                Eval("cantidadActEcon").ToString() == "72" ? "72. SERVICIOS DE ALOJAMIENTO TEMPORAL Y DE PREPARACIÓN DE ALIMENTOS Y BEBIDAS" : Eval("cantidadActEcon").ToString() == "81" ? "81. OTROS SERVICIOS EXCEPTO ACTIVIDADES GUBERNAMENTALES" : "")%>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Ámbito">
            <ItemTemplate>
              <asp:Label ID="lblAmbito" runat="server" Text='<%# string.Format("{0}", Eval("idAmbito").ToString() == "1" ? "MUNCIPAL" : Eval("idAmbito").ToString() == "2" ? "ESTATAL" : Eval("idAmbito").ToString() == "3" ? "REGIONAL" : Eval("idAmbito").ToString() == "4" ? "NACIONAL" : "INTERNACIONAL")%>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>
          <asp:BoundField DataField="eje" HeaderText="Eje"/>
            <asp:TemplateField HeaderText="Se encuentra alineado a Objetivos del Desarrollo Sostenible de la ONU (ODS)">
              <ItemTemplate>
                <asp:Label ID="lblODS" runat="server" Text='<%# string.Format("{0} {1}", Eval("ODSActivo").ToString() == "True" ? "SI" : "NO", Eval("idODS") == null ? " " : Eval("idODS").ToString() == "1" ? "1. FIN DE LA POBREZA" : Eval("idODS").ToString() == "2" ? "2. HAMBRE CERO" : Eval("idODS").ToString() == "3" ? "3. SALUD Y BIENESTAR" :
                  Eval("idODS").ToString() == "4" ? "4. EDUCACIÓN DE CALIDAD" : Eval("idODS").ToString() == "5" ? "5. IGUALDAD DE GÉNERO" : Eval("idODS").ToString() == "6" ? "6. AGUA LIMPIA Y SANEAMIENTO" : Eval("idODS").ToString() == "7" ? "7. ENERGÍA ASEQUIBLE Y NO CONTAMINANTE" :
                  Eval("idODS").ToString() == "8" ? "8. TRABAJO DOCENTE Y CRECIMIENTO ECONÓMICO" : Eval("idODS").ToString() == "9" ? "9. INDUSTRIA, INNOVACIÓN E INFRAESTRUCTURA" : Eval("idODS").ToString() == "10" ? "10. REDUCCIÓN DE LAS DESIGUALDADES" : Eval("idODS").ToString() == "11" ? "11. CIUDADES Y COMUNIDADES SOSTENIBLES" :
                  Eval("idODS").ToString() == "12" ? "12. PRODUCCIÓN Y CONSUMO RESPONSABLES" : Eval("idODS").ToString() == "13" ? "13. ACCIÓN POR EL CLIMA" : Eval("idODS").ToString() == "14" ? "14. VIDA SUBMARINA" : Eval("idODS").ToString() == "15" ? "15. VIDA DE ECOSISTEMAS TERRESTRES" : 
                  Eval("idODS").ToString() == "16" ? "16. PAZ, JUSTICIA E INSTITUCIONES SÓLIDAS" : Eval("idODS").ToString() == "17" ? "	17. ALIANZAS PARA LOGRAR LOS OBJETIVOS" : "")%>'></asp:Label>
              </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Visualizar Convenio Completo">
              <ItemTemplate>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <asp:LinkButton ID="imgVisualizar"  runat="server" CommandArgument="<%#((CONVENIO)(Container.DataItem)).numConvenio %>" OnCommand="imgVisualizar_Command"><i class="fas fa-eye"></i></asp:LinkButton>
              </ItemTemplate>        
            </asp:TemplateField>
          </Columns>
        </asp:GridView>
      </div>
    </div>
  </div>
</asp:Content>