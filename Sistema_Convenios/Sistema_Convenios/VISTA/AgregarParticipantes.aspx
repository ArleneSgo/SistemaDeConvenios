<%@ Page Title="" Language="C#" MasterPageFile="~/PagMaestra.Master" AutoEventWireup="true" CodeBehind="AgregarParticipantes.aspx.cs" Inherits="VISTA.AgregarParticipantes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Titulos" runat="server">
  <h1 class="display-4 mb-2 mx-auto text-center" style="color:aliceblue">Registrar Nuevo Proyecto</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div  class="container mp-5 mt-4" >
    <div id="contactanosFormulario" class="contactanosFormulario">
      <div class="form-row">
        <div class="form-row">
          <asp:Label ID="Label1" runat="server" Text="Nombre del Proyecto:" style="font-size: 0.8571em;margin-bottom: 5px;color: #9A9A9A;"></asp:Label>
          <asp:TextBox ID="txbNombreProyecto" runat="server" Style="margin-left: 20px; margin-top: 24px;" Width="335px" Height="41px"></asp:TextBox>
          <asp:RegularExpressionValidator  ID="valNombre1" runat="server" ControlToValidate="txbNombreProyecto" ErrorMessage=" * Numero de digitos 
          incorrecto (3 - 100)" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{3,100}$" Display="Dynamic" ForeColor="Red" InitialValue=""/> 
          <asp:RequiredFieldValidator ID="valNombreExiste" runat="server" ErrorMessage=" * Favor de agregar un nombre" 
          ControlToValidate="txbNombreProyecto" Display="Dynamic" ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
        </div>
      </div>
      <div class="form-row">
        <div class="form-row">
          <asp:Label ID="lbl" runat="server" Text="Número de Participantes:" style="font-size: 0.8571em;margin-bottom: 5px;color: #9A9A9A;"></asp:Label>
          <asp:TextBox ID="txbNumParticipantes" runat="server" TextMode="Number" Style="margin-left: 20px; margin-top: 24px;" Width="335px" Height="41px"></asp:TextBox>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Solo se admiten números" 
          ControlToValidate="txbNumParticipantes" Display="Dynamic" ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
        </div>
      </div>
    </div>
    <asp:Button ID="btnAtras" class="btn btn-primary align-content-center" runat="server" Text="Atras" OnClick="btnAtras_Click" Visible="true" />
    <asp:Button ID="btnGuardar" class="btn btn-primary" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
    <div id="mensaje" visible="false" runat="server" class="alert alert-success mt-1" role="alert"> Guardado
    </div>
  </div>
</asp:Content>
