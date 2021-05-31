<%@ Page Title="" Language="C#" MasterPageFile="~/PagMaestra.Master" AutoEventWireup="true" CodeBehind="AgregarProyecto.aspx.cs" Inherits="VISTA.AgregarProyecto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Titulos" runat="server">
  <h1 class="display-4 mb-2 mx-auto text-center" style="color:aliceblue">Registrar Nuevo Proyecto</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div  class="container mp-5 mt-4" >
      <div class="form-low">
        <div class="form-low">
          <asp:Label ID="Label2" runat="server" Text="Nombre del Instrumento Jurídico" style="font-size: 0.8571em;margin-bottom: 5px;color: #9A9A9A;"></asp:Label>
          <asp:Label ID="lblNombreIns" runat="server" Text="" style="font-size: 0.8571em;margin-bottom: 5px;margin-left: 20px; margin-top: 24px;"></asp:Label>
        </div>
      </div>
      <div class="form-low">
        <div class="form-low">
          <asp:Label ID="Label3" runat="server" Text="Nombre de la(s) Institucion(es) con la que se suscribe el instrumento jurídico:" style="font-size: 0.8571em;margin-bottom: 5px;color: #9A9A9A;"></asp:Label>
          <asp:Label ID="lblNombreInst" runat="server" Text="" style="font-size: 0.8571em;margin-bottom: 5px;margin-left: 20px; margin-top: 24px;"></asp:Label>
        </div>
      </div>
      <div class="form-low">
        <div class="form-low">
          <asp:Label ID="Label5" runat="server" Text="Nombre del Representante de la Institución con la que se suscribe el instrumento jurídico:" style="font-size: 0.8571em;margin-bottom: 5px;color: #9A9A9A;"></asp:Label>
          <asp:Label ID="lblNombreRep" runat="server" Text="" style="font-size: 0.8571em;margin-bottom: 5px;margin-left: 20px; margin-top: 24px;"></asp:Label>
        </div>
      </div>
      <div class="form-row">
        <div class="form-row">
          <asp:Label ID="Label1" runat="server" Text="Nombre del Proyecto:" style="font-size: 0.8571em;margin-bottom: 5px;color: #9A9A9A;"></asp:Label>
          <asp:TextBox class="form-col-md-2" ID="txbNombreProyecto" runat="server" Style="margin-left: 20px; margin-top: 24px;" Width="335px" Height="41px"></asp:TextBox>
          <asp:RegularExpressionValidator  ID="valNombre1" runat="server" ControlToValidate="txbNombreProyecto" ErrorMessage=" * Numero de digitos 
          incorrecto (3 - 100)" ValidationExpression="^[a-zA-ZÀ-ÿ0-Z0-9'@&#.ñ\s]{3,100}$" Display="Dynamic" ForeColor="Red" InitialValue=""/> 
          <asp:RequiredFieldValidator ID="valNombreExiste" runat="server" ErrorMessage=" * Favor de agregar un nombre" 
          ControlToValidate="txbNombreProyecto" Display="Dynamic" ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
        </div>
      </div>
      <div class="form-row">
        <div class="form-row">
          <div class="form-col-md-2">
            <label style="font-size: 0.8571em;margin-bottom: 5px;color: #9A9A9A;">Inicio:</label> 
          </div>
          <div class="form-col-md-2">
            <asp:TextBox ID="txtInicioFecha" class="form-control" Style="margin-top:24px" runat="server" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="valFechaIni" runat="server" ErrorMessage=" * Favor de agregar fecha" 
            ControlToValidate="txbNombreProyecto" Display="Dynamic" ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
          </div>
          <div class="form-col-md-2">
            <label>Fin:</label>
          </div>
          <div class="form-col-md-2">
            <asp:TextBox ID="txtFinFecha" class="form-control" Style="margin-top:24px" runat="server" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="valFechaFin" runat="server" ErrorMessage=" * Favor de agregar fecha" 
            ControlToValidate="txbNombreProyecto" Display="Dynamic" ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
          </div>
            <asp:CompareValidator ID="CompareValidator2" ControlToCompare="txtInicioFecha" ControlToValidate="txtFinFecha" Display="Dynamic"
            ErrorMessage   =" * La fecha de fin debe ser mayor a la de inicio" Operator="GreaterThanEqual" Type="Date" runat="server" ForeColor="Red">
          </asp:CompareValidator> 
        </div>
      </div>
    
    <asp:Button ID="btnAtras" class="btn btn-primary align-content-center" runat="server" Text="Atras" OnClientClick="btnAtrasClick()" OnClick="btnAtras_Click" Visible="true" />
    <asp:Button ID="btnGuardar" class="btn btn-primary" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
    <div id="mensaje" visible="false" runat="server" class="alert alert-success mt-1" role="alert"> Guardado
    </div>
  </div>

  <script>
      /*Deshabilitar RequireValidator*/
      function btnAtrasClick() {
          ValidatorEnable(document.getElementById('<%= valNombreExiste.ClientID %>'), false);
          ValidatorEnable(document.getElementById('<%= valFechaIni.ClientID %>'), false);
          ValidatorEnable(document.getElementById('<%= valFechaFin.ClientID %>'), false);
      }
  </script>
</asp:Content>
