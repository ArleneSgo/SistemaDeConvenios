<%@ Page Title="" Language="C#" MasterPageFile="~/PagMaestra.Master" AutoEventWireup="true" CodeBehind="AgregarConvenio.aspx.cs" Inherits="VISTA.AgregarConvenio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Titulos" runat="server">
  <h1 class="display-4 mb-2 mx-auto text-center" style="color:aliceblue">Agregar Convenio</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div  class="container mp-5 mt-4" >            
    <div id="contactanosFormulario" class="contactanosFormulario">
      <h5>Datos del Instrumento Jurídico</h5> 
        <div class="form-row">        
          <div class="form-group col-md-6">
            <h6>Nombre del Instrumento Jurídico</h6>
              <asp:DropDownList ID="NomJurDDL" runat="server">
                <asp:ListItem Value="">Seleccionar</asp:ListItem>
                <asp:ListItem Value="SERVICIO SOCIAL">SERVICIO SOCIAL</asp:ListItem>
                <asp:ListItem Value="RESIDENCIAS">RESIDENCIAS</asp:ListItem>
                <asp:ListItem Value="CONVENIO MARCO">CONVENIO MARCO</asp:ListItem>
              </asp:DropDownList>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" * Favor de seleccionar una opción" 
              ControlToValidate="NomJurDDL" Display="Dynamic" ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
          </div>
          <div class="form-group col-md-6">
            <div class="form-row">
              <h6>Vigencia del Instrumento Jurídico</h6>
            </div>
            <div class="form-row">
              <div class="form-col-md-2">
                <label>Inicio:</label> 
              </div>
              <div class="form-col-md-2">
                <asp:TextBox ID="txtInicioFecha" class="form-control"  runat="server" TextMode="Date"></asp:TextBox>
              </div>
              <div class="form-col-md-2">
                <label>Fin:</label>
              </div>
              <div class="form-col-md-2">
                <asp:TextBox ID="txtFinFecha" class="form-control"  runat="server" TextMode="Date"></asp:TextBox>
              </div>
              <asp:CompareValidator ID="CompareValidator2" ControlToCompare="txtInicioFecha" ControlToValidate="txtFinFecha" Display="Dynamic"
                ErrorMessage =" * La fecha de fin debe ser mayor a la de inicio" Operator="GreaterThanEqual" Type="Date" runat="server" ForeColor="Red">
              </asp:CompareValidator> 
            </div>  
          </div>
          
        </div>      
        <div class="form-row" >
          <div class="form-group col-md-6">
            <h6>Objeto/objetivo del Instrumento Jurídico</h6>
              <asp:DropDownList ID="ObjJurDDL" runat="server">
                <asp:ListItem Value="">Seleccionar</asp:ListItem>
                <asp:ListItem Value="SERVICIO SOCIAL">SERVICIO SOCIAL</asp:ListItem>
                <asp:ListItem Value="RESIDENCIAS">RESIDENCIAS</asp:ListItem>
                <asp:ListItem Value="CONVENIO MARCO">CONVENIO MARCO</asp:ListItem>
              </asp:DropDownList>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" * Favor de seleccionar una opción" 
              ControlToValidate="ObjJurDDL" Display="Dynamic" ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
          </div>

            <div class="form-group col-md-6">
            <div class="form-row">
              <h6>Se encuentra publicado en algún medio</h6>
            </div>
            <div class="form-row">
              <div class="form-col-md-2">
                <input type="radio" id="rbtnSiMedio" name="medio" value="1" runat="server" ClientIDMode="Static" onclick="Selected();"/>
                <label for="rbtnSiMedio">Si</label><br>
              </div>
              <div class="form-col-md-2">
                <input type="radio" id="rbtnNoMedio" name="medio" value="0" runat="server" ClientIDMode="Static" onclick="Selected();" checked/>
                <label for="rbtnNoMedio">No</label><br>
              </div>                
            </div>
            <div class="form-row" id="cualmedio" style="display: none" >
              <div class="form-col-md-2">
                <label>Indique en cuál:</label>
              </div>
              <div class="form-col-md-5">
                <asp:TextBox ID="txtMedio" CssClass="form-control" runat="server" MaxLength="50"></asp:TextBox>
              </div>
              <asp:RequiredFieldValidator Enabled="false" ID="rfvMedio" runat="server" ErrorMessage="* Campo Requerido" ControlToValidate="txtMedio" 
              Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>  
          </div>




          <div class="form-group ">
            <div class="form-row">
              <h6> Naturaleza</h6>
            </div>
            <div class="form-row">   
              <div class="form-group col-md-4">
                <asp:DropDownList ID="NaturalezaDDL" runat="server">
                  <asp:ListItem Value="">Seleccionar</asp:ListItem>
                  <asp:ListItem Value="1">SERVICIO SOCIAL</asp:ListItem>
                  <asp:ListItem Value="2">RESIDENCIAS PROFESIONALES</asp:ListItem>
                  <asp:ListItem Value="3">EDUCACIÓN DUAL</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=" * Favor de seleccionar una opción" 
                ControlToValidate="NaturalezaDDL" Display="Dynamic" ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
              </div>
              <div class="form-group col-md-2">
                <input type="radio" id="rbtnPresencial" name="modalidad" value="1" runat="server" />
                <label for="rbtnPresencial">Presencial</label><br>
                <input type="radio" id="rbtnVirtual" name="modalidad" value="2" runat="server"/>
                <label for="rbtnVirtual">Virtual</label><br>
                <input type="radio" id="rbtnMixta" name="modalidad" value="3" runat="server"/>
                <label for="rbtnMixta">Mixta</label><br>
              </div>  
              <div class="form-group col-md-6">
                <div class="form-row">
                  <div class="form-group col">
                    <label>Prestación:</label>
                    <asp:TextBox ID="txtPrestacion" CssClass="form-control" runat="server" MaxLength="100"></asp:TextBox>
                  </div>
                  <div class="form-group col">
                    <label>Donación:</label>
                    <asp:TextBox ID="txtDonacion" CssClass="form-control" runat="server" MaxLength="100"></asp:TextBox>
                  </div>
                </div>
                <div class="form-row">
                  <div class="form-group col">
                    <label>Comodato:</label>
                    <asp:TextBox ID="txtComodato" CssClass="form-control" runat="server" MaxLength="100"></asp:TextBox>             
                  </div>
                  <div class="form-group col">
                    <label>Educación Continua:</label>
                    <asp:TextBox ID="txtEducacion" CssClass="form-control" runat="server" MaxLength="100"></asp:TextBox>
                  </div>
                </div>             
              </div>
       
              <div class="form-group col-md-2" id="becasMod"  >
                <label>Movilidad/Intercambio</label> <br>
                <input type="radio" id="rbtnPresencialBecas" name="modalidadBecas" value="1" runat="server" />
                <label for="rbtnPresencialBecas">Presencial</label><br>
                <input type="radio" id="rbtnVirtualBecas" name="modalidadBecas" value="2" runat="server" />
                <label for="rbtnVirtualBecas">Virtual</label><br>
                <input type="radio" id="rbtnMixtaBecas" name="modalidadBecas" value="3" runat="server"/>
                <label for="rbtnMixtaBecas">Mixta</label><br>
              </div>
              <div class="form-group col-md-3 ">
                <input type="checkbox" id="cbxBecas" name="becas" onclick="Checado()" />
                <label for="cbxBecas"> Becas</label><br>
                <div id="becas" style="display: none" >
                  <label>Indique nombre de la Beca:</label>
                  <asp:TextBox ID="txtBecas" CssClass="form-control" runat="server" MaxLength="100"></asp:TextBox>
                </div>  
              </div>                                  
            </div>          
          </div>
        </div>
        <div class="form-row">
          <div class="form-group col-md-6">
            <h6>Nombre del Representante del IT que suscribió el instrumento jurídico &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h6>
            <asp:TextBox ID="txtNombreRepITH" CssClass="form-control" runat="server" MaxLength="150"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvnombreRepITH" runat="server" ErrorMessage="* Campo Requerido" ControlToValidate="txtNombreRepITH" 
            Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="rfvnombreRepITH1" runat="server" ErrorMessage="* Formato Incorrecto Solo Se Permiten Letras " 
            ControlToValidate="txtNombreRepITH" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-ZñÑáéíóúÁÉÓÚ ]{1,}$"></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator ID="rfvnombreRepITH2" runat="server" ErrorMessage="* Tamaño inválido, favor de ingresar el nombre 
            correctamente " ControlToValidate="txtNombreRepITH" Display="Dynamic" ForeColor="Red" ValidationExpression=".{8}.*"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group col-md-6">
          <h6>Nombre comercial de la(s) Institución(es) con la que se suscribe el instrumento jurídico &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
          &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h6>
          <asp:TextBox ID="txtNombreInstitucion" CssClass="form-control" runat="server" MaxLength="150"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="* Campo Requerido" 
          ControlToValidate="txtNombreInstitucion" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="* Formato Incorrecto Solo Se Permiten Letras " 
          ControlToValidate="txtNombreInstitucion" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-ZñÑáéíóúÁÉÓÚ ]{1,}$"></asp:RegularExpressionValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="* Tamaño inválido, favor de ingresar el 
          nombre correctamente " ControlToValidate="txtNombreInstitucion" Display="Dynamic" ForeColor="Red" ValidationExpression=".{2}.*"></asp:RegularExpressionValidator>
        </div>
      </div>
      <div class="form-row">
        <div class="form-group col-md-6">
          <h6>Nombre del Representante de la Institución con la que se suscribe el instrumento jurídico</h6>
            <asp:TextBox ID="txtNombreRepInstitucion" CssClass="form-control" runat="server" MaxLength="150"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="* Campo Requerido" 
            ControlToValidate="txtNombreRepInstitucion" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="* Formato Incorrecto Solo Se Permiten Letras " 
            ControlToValidate="txtNombreRepInstitucion" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-ZñÑáéíóúÁÉÓÚ ]{1,}$"></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="* Tamaño inválido, favor de ingresar el nombre 
            correctamente " ControlToValidate="txtNombreRepInstitucion" Display="Dynamic" ForeColor="Red" ValidationExpression=".{8}.*"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group col-md-6">
          <h6>Cargo del Representante de la Institución con la que se suscribe el instrumento jurídico</h6>
            <asp:TextBox ID="txtCargoRepInstitucion" CssClass="form-control" runat="server" MaxLength="50"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="* Campo Requerido" 
            ControlToValidate="txtCargoRepInstitucion" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator> 
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="* Formato Incorrecto Solo Se Permiten Letras " 
            ControlToValidate="txtCargoRepInstitucion" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-ZñÑáéíóúÁÉÓÚ ]{1,}$"></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="* Tamaño inválido, favor de ingresar el 
            nombre correctamente " ControlToValidate="txtCargoRepInstitucion" Display="Dynamic" ForeColor="Red" ValidationExpression=".{3}.*"></asp:RegularExpressionValidator>
        </div>
      </div>                       
      <div class="form-row">
        <h5>La suscripción del instrumento jurídico implica el uso de recursos</h5> 
      </div>
      <div class="form-row">
        <div class="form-col-md-6">
          <input type="radio" id="rbtnHumanos" name="recursos" value="2" onclick="SelectedMonto();" runat="server"  ClientIDMode="Static" checked/>
          <label for="rbtnHumanos">Humanos&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label><br>
        </div>
        <div class="form-col-md-6">
          <input type="radio" id="rbtnFinancieros" name="recursos" value="1" onclick="SelectedMonto();" runat="server"  ClientIDMode="Static"/>
          <label for="rbtnFinancieros">Financieros&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label><br>
        </div>
        <div class="form-col-md-6">
          <input type="radio" id="rbtnInfraestructura" name="recursos" value="3" onclick="SelectedMonto();" runat="server"  ClientIDMode="Static"/>
          <label for="rbtnInfraestructura">Infraestructura&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label><br>
        </div>
        <div class="form-col-md-6">
          <input type="radio" id="rbtnEquipo" name="recursos" value="4" onclick="SelectedMonto();" runat="server"  ClientIDMode="Static"/>
          <label for="rbtnEquipo">Equipo&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label><br>
        </div>
        <div class="form-col-md-6">
          <input type="radio" id="rbtnTecnologicos" name="recursos" value="5" onclick="SelectedMonto();" runat="server"  ClientIDMode="Static"/>
          <label for="rbtnTecnologicos">Tecnológicos&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label><br>
        </div>                         
      </div>
      <div class="form-row" id="monto" style="display: none" >
        <label>Indique el monto:</label>
        <asp:TextBox ID="txtMonto" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="* Solo números" ControlToValidate="txtMonto" 
        Display="Dynamic" ForeColor="Red" ValidationExpression="((\+|-)?([0-9]+)(\.[0-9]+)?)|((\+|-)?\.?[0-9]+)"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator Enabled="false" ID="rfvMonto" runat="server" ErrorMessage="* Campo Requerido" ControlToValidate="txtMonto" 
        Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator> 
      </div>  
      <div class="form-row">
        <h5>Involucra algún aspecto de Propiedad Intelectual</h5> 
      </div>
      <div class="form-row">
        <div class="form-col-md-6">
          <input type="radio" id="rbtnSiPropInt" name="propiedad" value="1" onclick="SelectedProp();" runat="server"  ClientIDMode="Static"/>
          <label for="rbtnSiPropInt">Si&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label><br>
        </div>
        <div class="form-col-md-6">
          <input type="radio" id="rbtnNoPropInt" name="propiedad" value="2" onclick="SelectedProp();" runat="server"  ClientIDMode="Static" checked/>
          <label for="rbtnNoPropInt">No&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label><br>
        </div>
      </div>
      <div class="form-row" id="propiedadInt" style="display: none" >
        <label>Mencione cuál(les):</label>
        <asp:TextBox ID="txtPropiedadInt" CssClass="form-control" runat="server" MaxLength="100"></asp:TextBox>
        <asp:RequiredFieldValidator Enabled="false" ID="rfvPropInt" runat="server" ErrorMessage="* Campo Requerido" ControlToValidate="txtPropiedadInt" 
        Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator> 
      </div>  
    </div>
    <div class="form-row">                        
      <h5>Entregables</h5>
    </div> 
    <div class="form-row col-md-6">
      <label>Indique cuáles:</label>
      <asp:TextBox ID="txtEntregables" CssClass="form-control" runat="server" MaxLength="100"></asp:TextBox>
    </div>
    <div class="form-row">
      <div class="form-group col-md-3">
        <div class="form-row">
          <h5>Tipo de Convenio</h5>
        </div>
        <asp:RadioButtonList ID="rbtnTipo" RepeatDirection="Horizontal"  runat="server">
          <asp:ListItem Value="1">Bilateral&nbsp&nbsp&nbsp&nbsp&nbsp</asp:ListItem>
          <asp:ListItem Value="2">Multilateral</asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage=" * Favor de seleccionar una opción" 
        ControlToValidate="rbtnTipo" Display="Dynamic" ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
        <asp:RadioButtonList ID="rbtnTipo2" RepeatDirection="Horizontal"  runat="server">
          <asp:ListItem Value="1">Marco&nbsp&nbsp&nbsp&nbsp&nbsp</asp:ListItem>
          <asp:ListItem Value="2">Especifico</asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage=" * Favor de seleccionar una opción" 
        ControlToValidate="rbtnTipo2" Display="Dynamic" ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
      </div>
      <div class="form-group col-md-4">
        <div class="form-row">
          <h5>Sector</h5>
        </div>
        <div class="form-row">
          <asp:RadioButtonList ID="rbtnSector" RepeatDirection="Horizontal"  runat="server">
            <asp:ListItem Value="1">Público&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</asp:ListItem>
            <asp:ListItem Value="2">Privado&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</asp:ListItem>
            <asp:ListItem Value="3">Social&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</asp:ListItem>
          </asp:RadioButtonList>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage=" * Favor de seleccionar una opción" 
          ControlToValidate="rbtnSector" Display="Dynamic" ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
        </div>
      </div>
      <div class="form-group col-md-5">
        <div class="form-row">
          <h5>Actividad Económica</h5>
        </div>
        <div class="form-row">
          <div class="form-col-md-4">
            <input type="radio" id="rbtnPrimaria" name="actE" value="1" onclick="SelectedAct();" runat="server"  ClientIDMode="Static" checked/>
            <label for="rbtnPrimaria" >Primaria&nbsp&nbsp</label>
            <a href="#" data-toggle="tooltip" title="Explotación de recursos naturales"><i class="fas fa-info-circle"></i></a>
            <label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
          </div>
          <div class="form-col-md-4">
            <input type="radio" id="rbtnSecundaria" name="actE" value="2" onclick="SelectedAct();" runat="server"  ClientIDMode="Static" />
            <label for="rbtnSecundaria">Secundaria&nbsp&nbsp</label>
            <a href="#" data-toggle="tooltip" title="Transformación de bienes"><i class="fas fa-info-circle"></i></a>
            <label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
          </div>
          <div class="form-col-md-4">
            <input type="radio" id="rbtnTerciaria" name="actE" value="3" onclick="SelectedAct();" runat="server"  ClientIDMode="Static" />
            <label for="rbtnTerciaria">Terciaria&nbsp&nbsp</label>
            <a href="#" data-toggle="tooltip" title=" ° Distribucion de bienes &#013° Operaciones con información &#013° Operaciones con activos &#013° 
            Servicios cuyo insumo principal es el conocimiento y la experiencia personal &#013° Servicios relacionados con la recreación &#013° Servicios 
            residuales"><i class="fas fa-info-circle"></i></a>
            <label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
          </div>
        </div>
        <div class="form-row form-col-md-4" id="vprimariaDDL"  style="display: block" >
          <asp:DropDownList Width="300px" CssClass="form-col-md-4" ID="primariaDDL" runat="server" >
            <asp:ListItem Value="">Seleccionar</asp:ListItem>
            <asp:ListItem Value="11">AGRICULTURA, CRÍA Y EXPLOTACIÓN DE ANIMALES, APROVECHAMIENTO FORESTAL, PESCA Y CAZA</asp:ListItem>
          </asp:DropDownList>
          <asp:RequiredFieldValidator ID="rfvPrimaria" runat="server" ErrorMessage=" * Favor de seleccionar una opción" ControlToValidate="primariaDDL" 
          Display="Dynamic" ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
        </div>
        <div class="form-row" id="vsecundariaDDL"  style="display: none"  >
          <asp:DropDownList Width="300px" ID="secundariaDDL" runat="server">
            <asp:ListItem Value="">Seleccionar</asp:ListItem>
            <asp:ListItem Value="21">MINERIA</asp:ListItem>
            <asp:ListItem Value="22">GENERACION, TRANSMISION Y DISTRIBUCION DE ENERGIA ELECTRICA, AGUA Y SUMINISTRO DE GAS POR DUCTOS AL CONSUMIDOR FINAL</asp:ListItem>
            <asp:ListItem Value="23">CONSTRUCCION</asp:ListItem>
            <asp:ListItem Value="31">INDUSTRIAS MANUFACTURERAS</asp:ListItem>
          </asp:DropDownList>
          <asp:RequiredFieldValidator Enabled="false" ID="rfvSecundaria" runat="server" ErrorMessage=" * Favor de seleccionar una opción" 
          ControlToValidate="secundariaDDL" Display="Dynamic" ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
        </div>
        <div class="form-row" id="vterciariaDDL"  style="display: none" >
          <asp:DropDownList Width="300px" ID="terciariaDDL" runat="server" >
            <asp:ListItem Value="">Seleccionar</asp:ListItem>
            <asp:ListItem Value="43">COMERCIO AL POR MAYOR</asp:ListItem>
            <asp:ListItem Value="46">COMERCIO AL POR MENOR</asp:ListItem>
            <asp:ListItem Value="48">TRANSPORTES CORREOS Y ALMACENAMIENTO</asp:ListItem>
            <asp:ListItem Value="51">INFORMACION EN MEDIOS MASIVOS</asp:ListItem>
            <asp:ListItem Value="52">SERVICIOS FINANCIEROS Y DE SEGUROS</asp:ListItem>
            <asp:ListItem Value="53">SERVICIOS INMOBILIARIOS Y DE ALQUILER DE BIENES MUEBLES E INTANGIBLES</asp:ListItem>
            <asp:ListItem Value="54">SERVICIOS PROFESIONALES CIENTIFICOS Y TECNICOS</asp:ListItem>
            <asp:ListItem Value="55">CORPORATIVOS</asp:ListItem>
            <asp:ListItem Value="56">SERVICIOS DE APOYO A LOS NEGOCIOS Y MANEJO DE DESECHOS Y SERVICIOS DE REMEDIACION</asp:ListItem>
            <asp:ListItem Value="61">SERVICIOS EDUCATIVOS</asp:ListItem>
            <asp:ListItem Value="62">SERVICIOS DE SALUD Y DE ASISTENCIA SOCIAL</asp:ListItem>
            <asp:ListItem Value="71">SERVICIOS DE ESPARCIAMIENTO CULTURALES Y DEPORTIVOS, Y OTROS SERVICIOS RECREATIVOS</asp:ListItem>
            <asp:ListItem Value="72">SERVICIOS DE ALOJAMIENTO TEMPORAL Y DE PREPARACION DE ALIMENTOS Y BEBIDAS</asp:ListItem>
            <asp:ListItem Value="81">OTROS SERVICIOS EXCEPTO ACTIVIDADES GUBERNAMENTALES</asp:ListItem>
          </asp:DropDownList>
          <asp:RequiredFieldValidator Enabled="false" ID="rfvTerciaria"  runat="server" ErrorMessage=" * Favor de seleccionar una opción" 
          ControlToValidate="terciariaDDL" Display="Dynamic" ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
        </div>
      </div>
    </div>
    <div class="form-row">
      <div class="form-group col-md-3">
        <div class="form-row">
          <h5>Ámbito</h5>
        </div>
        <div class="form-row col-md-12">
          <asp:RadioButtonList ID="rbtnAmbito" RepeatDirection="Horizontal"  runat="server">
            <asp:ListItem Value="1">Municipal&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</asp:ListItem>
            <asp:ListItem Value="2">Estatal&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</asp:ListItem>
            <asp:ListItem Value="3">Regional&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</asp:ListItem>
            <asp:ListItem Value="4">Nacional&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</asp:ListItem>
            <asp:ListItem Value="5">Internacional&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</asp:ListItem>
          </asp:RadioButtonList>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage=" * Favor de seleccionar una opción" 
          ControlToValidate="rbtnAmbito" Display="Dynamic" ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
        </div>
      </div>
    </div>
    <div class="form-row">
      <div class="form-group col-md-6">
        <div class="form-row">
          <h5>Eje</h5>
        </div>                      
        <div class="form-row">
          <div class="form-group col-md-6">
          <input type="checkbox" id="cbxEducacion" name="eje" value="EDUCACION" onclick="SelectedOtro();" runat="server"  ClientIDMode="Static"/>
          <label for="cbxEducacion">Educación</label><br>
          <input type="checkbox" id="cbxCiencia" name="eje" value="CIENCIA" onclick="SelectedOtro();" runat="server"  ClientIDMode="Static"/>
          <label for="cbxEstatal">Ciencia</label><br>
          <input type="checkbox" id="cbxDesarrollo" name="eje" value="DESARROLLO TECNOLOGICO E INNOVACION" onclick="SelectedOtro();" runat="server"  
          ClientIDMode="Static"/>
          <label for="cbxDesarrollo">Desarrollo Tecnológico e Innovación</label><br>
        </div>
          <div class="form-group col-md-4">
          <input type="checkbox" id="cbxCultura" name="eje" value="CULTURA" onclick="SelectedOtro();" runat="server"  ClientIDMode="Static"/>
          <label for="cbxCultura">Cultura</label><br>
          <input type="checkbox" id="cbxDeporte" name="eje" value="DEPORTE" onclick="SelectedOtro();" runat="server"  ClientIDMode="Static"/>
          <label for="cbxDeporte">Deporte</label><br>
          <input type="checkbox" id="cbxOtro" name="eje" value="6" onclick="SelectedOtro();" runat="server"  ClientIDMode="Static"/>
          <label for="cbxOtro" >Otro</label><br>
        </div>
        </div>
        <div class="form-row" id="otro" style="display: none" >
          <div class="form-col-md-2"><label>Indique:</label></div>
          <div class="form-col-md-5"><asp:TextBox ID="txtOtro" CssClass="form-control" runat="server" MaxLength="100"></asp:TextBox></div>
          <asp:RequiredFieldValidator Enabled="false" ID="rfvOtro" runat="server" ErrorMessage="* Campo Requerido" ControlToValidate="txtOtro" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
      </div>
    </div>
    <div class="form-row">
    <h5>Objetivos del Desarrollo Sostenible de la ONU (ODS)</h5> 
  </div>
      <div class="form-row">
        <h6>Se encuentra alineado</h6>
      </div>
      <div class="form-row">
        <div class="form-row">
          <div class="form-col-md-6">
            <input type="radio" id="rbtnSiODS" name="ods" value="1"  onclick="SelectedODS();" runat="server"  ClientIDMode="Static"/>
            <label for="rbtnSiODS">Si&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label><br>
          </div>
          <div class="form-col-md-6">
            <input type="radio" id="rbtnNoODS" name="ods" value="2"  onclick="SelectedODS();" runat="server"  ClientIDMode="Static" checked/>
            <label for="rbtnNoODS">No&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label><br>
          </div>
        </div>
     </div>
    <div class="form-row" id="vods" style="display: none" >
      <asp:DropDownList ID="odsDDL" runat="server">
        <asp:ListItem Value="">Seleccionar</asp:ListItem>
        <asp:ListItem Value="1">FIN DE LA POBREZA</asp:ListItem>
        <asp:ListItem Value="2">HAMBRE CERO</asp:ListItem>
        <asp:ListItem Value="3">SALUD Y BIENESTAR</asp:ListItem>
        <asp:ListItem Value="4">EDUCACION DE CALIDAD</asp:ListItem>
        <asp:ListItem Value="5">IGUALDAD DE GENERO</asp:ListItem>
        <asp:ListItem Value="6">AGUA LIMPIA Y SANEAMIENTO</asp:ListItem>
        <asp:ListItem Value="7">ENERGIA ASEQUIBLE Y NO CONTAMINANTE</asp:ListItem>
        <asp:ListItem Value="8">TRABAJO DOCENTE Y CRECIMIENTO ECONOMICO</asp:ListItem>
        <asp:ListItem Value="9">INDUSTRIA, INNOVACION E INFRAESTRUCTURA</asp:ListItem>
        <asp:ListItem Value="10">REDUCCION DE LAS DESIGUALDADES</asp:ListItem>
        <asp:ListItem Value="11">CIUDADES Y COMUNIDADES SOSTENIBLES</asp:ListItem>
        <asp:ListItem Value="12">PRODUCCION Y CONSUMO RESPONSABLES</asp:ListItem>
        <asp:ListItem Value="13">ACCION POR EL CLIMA</asp:ListItem>
        <asp:ListItem Value="14">VIDA SUBMARINA</asp:ListItem>
        <asp:ListItem Value="15">VIDA DE ECOSISTEMAS TERRESTRES</asp:ListItem>
        <asp:ListItem Value="16">PAZ, JUSTICIA E INSTITUCIONES SOLIDAS</asp:ListItem>
        <asp:ListItem Value="17">ALIANZAS PARA LOGRAR LOS OBJETIVOS</asp:ListItem>
      </asp:DropDownList>
      <asp:RequiredFieldValidator Enabled="false" ID="rfvvods"  runat="server" ErrorMessage=" * Favor de seleccionar una opción" 
      ControlToValidate="odsDDL" Display="Dynamic" ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
    </div>  
    <asp:Button ID="btnAtras" class="btn btn-primary align-content-center" runat="server" Text="Atras" OnClick=" btnAtras_Click" OnClientClick="btnAtrasClick()" Visible="true" />
    <asp:Button ID="btnGuardar" class="btn btn-primary" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
    <div id="mensaje" visible="false" runat="server" class="alert alert-success mt-1" role="alert"> Guardado
    </div>
  </div>

  <script>
  /*funcion para desplegar input si se selecciona si en "medio" */
    function Selected() {
      var rbtnSiMedio = document.getElementById("rbtnSiMedio");
      var rbtnNoMedio = document.getElementById("rbtnNoMedio");
      var cualmedio = document.getElementById("cualmedio");
      if (rbtnSiMedio.checked == true) {
        cualmedio.style.display = "block";
        ValidatorEnable(document.getElementById('<%= rfvMedio.ClientID %>'), true);
      }
      if (rbtnNoMedio.checked == true) {
        cualmedio.style.display = "none";
        ValidatorEnable(document.getElementById('<%= rfvMedio.ClientID %>'), false);
      }
    }
    </script>
    <script>
    /*funcion para desplegar input si se selecciona si en "becas" */
      function Checado() {
        var cbxBecas = document.getElementById("cbxBecas");
        var becas = document.getElementById("becas");
        if (cbxBecas.checked == true) {
          becas.style.display = "block";
        }
        else {
          becas.style.display = "none";
        }
      }
    </script>
    <script>
    /*funcion para desplegar input si se selecciona si en "financieros" */
      function SelectedMonto() {
        var rbtnFinancieros = document.getElementById("rbtnFinancieros");
        var monto = document.getElementById("monto");
        if (rbtnFinancieros.checked == true) {
          monto.style.display = "block";
          ValidatorEnable(document.getElementById('<%= rfvMonto.ClientID %>'), true);
        }
        if (rbtnFinancieros.checked == false) {
          monto.style.display = "none";
          ValidatorEnable(document.getElementById('<%= rfvMonto.ClientID %>'), false);
        }
      }
    </script>
    <script>
    /*funcion para desplegar input si se selecciona si en "propiedad intelectual" */
      function SelectedProp() {
        var rbtnSiPropInt = document.getElementById("rbtnSiPropInt");
        var propiedad = document.getElementById("propiedadInt");
        if (rbtnSiPropInt.checked == true) {
          propiedad.style.display = "block";
          ValidatorEnable(document.getElementById('<%= rfvPropInt.ClientID %>'), true);
        }
        if (rbtnSiPropInt.checked == false) {
          propiedad.style.display = "none";
          ValidatorEnable(document.getElementById('<%= rfvPropInt.ClientID %>'), false);
        }
      }
    </script>
    <script>
    /*funcion para desplegar input dependiendo seleccion en "actividad economica" */
      function SelectedAct() {
        var rbtnPrimaria = document.getElementById("rbtnPrimaria");
        var rbtnSecundaria = document.getElementById("rbtnSecundaria");
        var rbtnTerciaria = document.getElementById("rbtnTerciaria");
        var vprimariaDDL = document.getElementById("vprimariaDDL");
        var vsecundariaDDL = document.getElementById("vsecundariaDDL");
        var vterciariaDDL = document.getElementById("vterciariaDDL");
        if (rbtnPrimaria.checked == true) {
          vsecundariaDDL.style.display = "none";
          vterciariaDDL.style.display = "none";
          vprimariaDDL.style.display = "block";
          ValidatorEnable(document.getElementById('<%= rfvPrimaria.ClientID %>'), true);
          ValidatorEnable(document.getElementById('<%= rfvSecundaria.ClientID %>'), false);
          ValidatorEnable(document.getElementById('<%= rfvTerciaria.ClientID %>'), false);
        }
        if (rbtnSecundaria.checked == true) {
          vprimariaDDL.style.display = "none";
          vterciariaDDL.style.display = "none";
          vsecundariaDDL.style.display = "block";
          ValidatorEnable(document.getElementById('<%= rfvPrimaria.ClientID %>'), false);
          ValidatorEnable(document.getElementById('<%= rfvSecundaria.ClientID %>'), true); 
          ValidatorEnable(document.getElementById('<%= rfvTerciaria.ClientID %>'), false);
        }
        if (rbtnTerciaria.checked == true) {
          vprimariaDDL.style.display = "none";
          vsecundariaDDL.style.display = "none";
          vterciariaDDL.style.display = "block";
          ValidatorEnable(document.getElementById('<%= rfvPrimaria.ClientID %>'), false);
          ValidatorEnable(document.getElementById('<%= rfvSecundaria.ClientID %>'), false); 
          ValidatorEnable(document.getElementById('<%= rfvTerciaria.ClientID %>'), true);
        }
      }
    </script>
    <script>
    /*funcion para desplegar input dependiendo seleccion en "otro"*/
      function SelectedOtro() {
        var cbxOtro = document.getElementById("cbxOtro");
        var otro = document.getElementById("otro");
        if (cbxOtro.checked == true) {
          otro.style.display = "block";
          ValidatorEnable(document.getElementById('<%= rfvOtro.ClientID %>'), true);
        }
        if (cbxOtro.checked == false) {
          otro.style.display = "none";
          ValidatorEnable(document.getElementById('<%= rfvOtro.ClientID %>'), false);
        }
      }
    </script>
    <script>
      /*funcion para desplegar input dependiendo seleccion en "ODS"*/
      function SelectedODS() {
        var rbtnSiODS = document.getElementById("rbtnSiODS");
        var vods = document.getElementById("vods");
        if (rbtnSiODS.checked == true) {
          vods.style.display = "block";
          ValidatorEnable(document.getElementById('<%= rfvvods.ClientID %>'), true);
        }
        if (rbtnSiODS.checked == false) {
          vods.style.display = "none";
          ValidatorEnable(document.getElementById('<%= rfvvods.ClientID %>'), false);
        }
      }
    </script>
    <script>
        /*Deshabilitar RequireValidator*/
        function btnAtrasClick() {
            ValidatorEnable(document.getElementById('<%= RequiredFieldValidator1.ClientID %>'), false);
            ValidatorEnable(document.getElementById('<%= rfvMedio.ClientID %>'), false);
            ValidatorEnable(document.getElementById('<%= RequiredFieldValidator2.ClientID %>'), false);
            ValidatorEnable(document.getElementById('<%= RequiredFieldValidator3.ClientID %>'), false);
            ValidatorEnable(document.getElementById('<%= rfvnombreRepITH.ClientID %>'), false);
            ValidatorEnable(document.getElementById('<%= RequiredFieldValidator4.ClientID %>'), false);
            ValidatorEnable(document.getElementById('<%= RequiredFieldValidator5.ClientID %>'), false);
            ValidatorEnable(document.getElementById('<%= RequiredFieldValidator6.ClientID %>'), false);
            ValidatorEnable(document.getElementById('<%= rfvMonto.ClientID %>'), false);
            ValidatorEnable(document.getElementById('<%= rfvPropInt.ClientID %>'), false);
            ValidatorEnable(document.getElementById('<%= RequiredFieldValidator10.ClientID %>'), false);
            ValidatorEnable(document.getElementById('<%= RequiredFieldValidator11.ClientID %>'), false);
            ValidatorEnable(document.getElementById('<%= RequiredFieldValidator12.ClientID %>'), false);
            ValidatorEnable(document.getElementById('<%= rfvPrimaria.ClientID %>'), false);
            ValidatorEnable(document.getElementById('<%= rfvSecundaria.ClientID %>'), false);
            ValidatorEnable(document.getElementById('<%= rfvTerciaria.ClientID %>'), false);
            ValidatorEnable(document.getElementById('<%= RequiredFieldValidator16.ClientID %>'), false);
            ValidatorEnable(document.getElementById('<%= rfvOtro.ClientID %>'), false);
            ValidatorEnable(document.getElementById('<%= rfvvods.ClientID %>'), false);
        }
    </script>
</asp:Content>