<%@ Page Title="" Language="C#" MasterPageFile="~/PagMaestra.Master" AutoEventWireup="true" CodeBehind="AgregarParticipante.aspx.cs" Inherits="VISTA.AgregarParticipante" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Titulos" runat="server">
  <h1 class="display-4 mb-2 mx-auto text-center" style="color:aliceblue">Registrar Nuevo Participante</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div  class="container mp-5 mt-4" >
    <div id="contactanosFormulario" class="contactanosFormulario">
      <div class="form-row">
        <label>Tipo</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <div class="col-lg-10">
          <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" id="rbtn">
          <asp:ListItem Value="Alumno">&nbsp&nbsp Alumno&nbsp&nbsp&nbsp&nbsp</asp:ListItem>
          <asp:ListItem Selected="True" Value="Maestro">&nbsp&nbsp Maestro&nbsp&nbsp</asp:ListItem>
          </asp:RadioButtonList>
        </div>
      </div>
      <div class="form-row">
        <div class="form-row">
          <asp:Label ID="Label1" runat="server" Text="Nombre del Participante:" style="font-size: 0.8571em;margin-bottom: 5px;color: #9A9A9A;"></asp:Label>
          <asp:TextBox ID="txbNombreParticipante" runat="server" Style="margin-left: 20px; margin-top: 24px;" Width="335px" Height="41px"></asp:TextBox>
          <asp:RegularExpressionValidator  ID="valNombre1" runat="server" ControlToValidate="txbNombreParticipante" ErrorMessage=" * Numero de digitos 
          incorrecto (3 - 100)" ValidationExpression="^[a-zA-ZÀ-ÿ0-Z0-9'@&#.ñ\s]{3,100}$" Display="Dynamic" ForeColor="Red" InitialValue=""/> 
          <asp:RequiredFieldValidator ID="valNombreExiste" runat="server" ErrorMessage=" * Favor de agregar un nombre" 
          ControlToValidate="txbNombreParticipante" Display="Dynamic" ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
        </div>
      </div>
      <div class="form-row">
        <div class="form-row">
          <asp:Label ID="Label2" runat="server" Text="Carrera:" style="font-size: 0.8571em;margin-bottom: 5px;color: #9A9A9A;"></asp:Label>
          <asp:TextBox ID="txbCarrera" runat="server" Style="margin-left: 20px; margin-top: 24px;" Width="335px" Height="41px"></asp:TextBox>
          <asp:RegularExpressionValidator  ID="valCarrera" runat="server" ControlToValidate="txbCarrera" ErrorMessage=" * Numero de digitos 
          incorrecto (3 - 100)" ValidationExpression="^[a-zA-ZÀ-ÿ0-Z0-9'@&#.ñ\s]{3,100}$" Display="Dynamic" ForeColor="Red" InitialValue=""/> 
          <asp:RequiredFieldValidator ID="valCarreraExiste" runat="server" ErrorMessage=" * Favor de agregar carrera" 
          ControlToValidate="txbCarrera" Display="Dynamic" ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
        </div>
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
          ValidatorEnable(document.getElementById('<%= valCarreraExiste.ClientID %>'), false);
      }
  </script>
</asp:Content>
