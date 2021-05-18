<%@ Page Title="" Language="C#" MasterPageFile="~/PagMaestra.Master" AutoEventWireup="true" CodeBehind="VisualizarConvenio.aspx.cs" Inherits="VISTA.VisualizarConvenio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Titulos" runat="server">
  <h1 class="display-4 mb-2 mx-auto text-center" style="color:aliceblue">Visualizar Convenio</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div  class="container mp-5 mt-4" >
    <div id="ConvenioCompleto" >
      <div class="form-row"> 
        <h5>&nbsp Datos del Instrumento Jurídico</h5>
      </div>
      <div class="form-row">
        <div class="form-group col-md-4">
          <h6>&nbsp Nombre del Instrumento Jurídico</h6>
          &nbsp <asp:Label ID="lblNomInsJur" runat="server" ></asp:Label>
        </div>
        <div class="form-group col-md-5">
          <div class="form-row">
            <h6>Vigencia del Instrumento Jurídico</h6>
          </div>
          <div class="form-row">
            <div class="form-group col-md-3">
              <asp:Label ID="Label1" runat="server" Text="Inicio: "></asp:Label>
              <asp:Label ID="lblFechaIni" runat="server" ></asp:Label>
            </div>
            <div class="form-group col-md-3">
              <asp:Label ID="Label2" runat="server" Text="Término: "></asp:Label>
              <asp:Label ID="lblFechaFin" runat="server" ></asp:Label>
            </div>
            <div class="form-group col-md-4">
              <asp:Label ID="Label3" runat="server" Text="Plazo en meses: "></asp:Label>
              <asp:Label ID="lblPlazo" runat="server" ></asp:Label>
            </div>
          </div>
        </div>
        <div class="form-group col-md-3">
          <div class="form-row">
            <h6>Se encuentra publicado en algún medio</h6>
          </div>
          <div class="form-row">
            <div class="form-group col-md-3">
              <asp:Label ID="lblmedio" runat="server" ></asp:Label>
            </div>
            <div class="form-group col-md-3">
              <asp:Label ID="lblcualmedio" runat="server" ></asp:Label>
            </div>
          </div>
        </div>
      </div>  
      <div class="form-row">
        <div class="form-group col-md-4">
          <h6>&nbsp Objeto u objetivo del Instrumento Jurídico</h6>
          &nbsp <asp:Label ID="lblObjInsJur" runat="server" ></asp:Label>
        </div>
        <div class="form-group col-md-5">
          <div class="form-row">
            <h6>Naturaleza</h6>
          </div>
          <div class="form-row">
            <div class="form-group col-md-4">
              <asp:Label ID="lblNaturaleza" runat="server" ></asp:Label>
            </div>
            <div class="form-group col-md-4">
              <asp:Label ID="lblNaturMod" runat="server" ></asp:Label>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-4">
              <div class="form-row">
                <asp:Label ID="Label4" runat="server" Text="Becas:"></asp:Label>
              </div>
              <div class="form-row">
                <asp:Label ID="lblBecas" runat="server" ></asp:Label>
              </div>
            </div>
            <div class="form-group col-md-4">
              <div class="form-row">
                <asp:Label ID="Label5" runat="server" Text="Movilidad/Intercambio:"></asp:Label>
              </div>
              <div class="form-row">
                <asp:Label ID="lblBecaMod" runat="server" ></asp:Label>
              </div>
            </div>
          </div>
        </div>
        <div class="form-group col-md-2">
          <div class="form-row">
            <asp:Label ID="Label6" runat="server" Text="Prestación de Servicios:"></asp:Label>
          </div>
          <div class="form-row">
            <asp:Label ID="lblPrestacion" runat="server" ></asp:Label>
          </div>
          <div class="form-row">
            <asp:Label ID="Label7" runat="server" Text="Donación:"></asp:Label>
          </div>
          <div class="form-row">
            <asp:Label ID="lblDonacion" runat="server" ></asp:Label>
          </div>
          <div class="form-row">
            <asp:Label ID="Label8" runat="server" Text="Comodato:"></asp:Label>
          </div>
          <div class="form-row">
            <asp:Label ID="lblComodato" runat="server"></asp:Label>
          </div>
          <div class="form-row">
            <asp:Label ID="Label9" runat="server" Text="Educación Continua:"></asp:Label>
          </div>
          <div class="form-row">
            <asp:Label ID="lblEducacion" runat="server" ></asp:Label>
          </div>                                                                                                
        </div>
      </div>      
      <div class="form-row">
        <div class="form-group col-md-6">
          <div class="form-row">
            <h6>&nbsp Nombre del Representante del IT que suscribió el Instrumento Jurídico</h6>
          </div>
          <div class="form-row">
            &nbsp <asp:Label ID="lblNomRepIT" runat="server" ></asp:Label>
          </div>
        </div>
        <div class="form-group col-md-6">
          <div class="form-row">
            <h6>Nombre de la(s) Institución(es) con la que se suscribe el Instrumento Jurídico</h6>
          </div>
          <div class="form-row">
            <asp:Label ID="lblNombreInst" runat="server" ></asp:Label>
          </div>
        </div>
      </div>
      <div class="form-row">
        <div class="form-group col-md-6">
          <div class="form-row">
            <h6>&nbsp Nombre del Representante de la Institución con la que se suscribe el Instrumento Jurídico</h6>
          </div>
          <div class="form-row">
            &nbsp <asp:Label ID="lblNomRepIns" runat="server" ></asp:Label>
          </div>
        </div>
        <div class="form-group col-md-6">
          <div class="form-row">
            <h6>Cargo del Representante de la Institución con la que se suscribe el Instrumento Jurídico</h6>
          </div>
          <div class="form-row">
            <asp:Label ID="lblCargoRep" runat="server" ></asp:Label>
          </div>
        </div>
      </div>
      <div class="form-row">
        <div class="form-group col-md-4">
          <div class="form-row">
            <h6>&nbsp La suscripción del Instrumento Jurídico implica el uso de recursos</h6>
          </div>
          <div class="form-row">
            &nbsp<asp:Label ID="lblRecurso" runat="server" ></asp:Label>
            &nbsp<asp:Label ID="lblMonto" runat="server" ></asp:Label>
          </div>
        </div>
        <div class="form-group col-md-4">
          <div class="form-row">
            <h6>Involucra algún aspecto de Propiedad Intelectual</h6>
          </div>
          <div class="form-row">
            <div class="form-group col-md-2">
              <asp:Label ID="lblpropInt" runat="server" ></asp:Label>
            </div>
            <div class="form-group col-md-4">
              <asp:Label ID="lblPropIntCual" runat="server" ></asp:Label>
            </div>
          </div>
        </div>
        <div class="form-group col-md-4">
          <div class="form-row">
            <h6>Entregables</h6>
          </div>
          <div class="form-row">
            <asp:Label ID="lblEntregables" runat="server" ></asp:Label>
          </div>
        </div>
      </div>
      <div class="form-row">
        <div class="form-group col-md-4">
          <div class="form-row">
            <h5>&nbsp Tipo de Convenio</h5>
          </div>
          <div class="form-row">
            <div class="form-group col-md-4">
              &nbsp<asp:Label ID="lblTipo1" runat="server"></asp:Label>
            </div>
            <div class="form-group col-md-4">
              <br/><asp:Label ID="lblTipo2" runat="server" ></asp:Label>
            </div>
          </div>
        </div>
        <div class="form-group col-md-2">
          <div class="form-row">
            <h5>Sector</h5>
          </div>
          <div class="form-row">
            <asp:Label ID="lblSector" runat="server"></asp:Label>
          </div>
        </div>
        <div class="form-group col-md-6">
          <div class="form-row">
            <h5>Actividad Económica</h5>
          </div>
          <div class="form-row">
            <div class="form-group col-md-3">
              <asp:Label ID="lblActEcon" runat="server"></asp:Label>
            </div>
            <div class="form-group col-md-9">
              <asp:Label ID="lblActEconNum" runat="server" ></asp:Label>
            </div>
          </div>
        </div>
      </div>
      <div class="form-row">
        <div class="form-group col-md-4">
          <div class="form-row">
            <h5>&nbsp Ámbito</h5>
          </div>
          <div class="form-row">
            &nbsp<asp:Label ID="lblAmbito" runat="server" ></asp:Label>
          </div>
        </div>
        <div class="form-group col-md-2">
          <div class="form-row">
            <h5>Eje</h5>
          </div>
          <div class="form-row">
            <asp:Label ID="lblEje" runat="server" ></asp:Label>
          </div>
        </div>
        <div class="form-group col-md-6">
          <div class="form-row">
            <h5>Objetivo del Desarrollo Sostenible de la ONU (ODS)</h5>
          </div>
          <div class="form-row">
            <div class="form-group col-md-3">
              <asp:Label ID="lblAlineadoODS" runat="server" ></asp:Label>
            </div>
            <div class="form-group col-md-9">
              <asp:Label ID="lblODS" runat="server" ></asp:Label>
            </div>
          </div>
        </div>
      </div>     
    </div>
    <asp:Button ID="btnAtras" class="btn btn-primary align-content-center" runat="server" Text="Atras" OnClick="btnAtras_Click" Visible="true" />
    <asp:Button ID="btnImprimir" class="btn btn-primary" runat="server" Text="Imprimir" OnClientClick="ImprimeDiv();"/>
  </div>
  <script src="Include/js/xepOnline.jqPlugin.js"></script>
  <script src="../dist/js/scripts.js"></script>
  <script>
      function ImprimeDiv() {
          var divToPrint = document.getElementById('ConvenioCompleto');
          var newWin = window.open('', 'Print-Window');
          newWin.document.open();
          newWin.document.write('<html><head><link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>  </head><body onload="window.print()">' + divToPrint.innerHTML + '</body></html>');
          newWin.document.close();
      }
  </script>
</asp:Content>