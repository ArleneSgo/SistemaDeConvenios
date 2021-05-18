<%@ Page Title="" Language="C#" MasterPageFile="~/PagMaestra.Master" AutoEventWireup="true" CodeBehind="ModificarParticipante.aspx.cs" Inherits="VISTA.ModificarParticipante" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Titulos" runat="server">
  <h1 class="display-4 mb-2 mx-auto text-center" style="color:aliceblue">Registro de Participantes</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div  class="container mp-5 mt-4" >
    <div id="contactanosFormulario" class="contactanosFormulario">
      <div class="form-row">
        <div>
          <label >Nombre del Proyecto</label>
          <asp:DropDownList AutoPostBack="true" CssClass="custom-select" runat="server" Style="margin-left: 20px; margin-top: 24px;" Width="335px" Height="41px"  ID="proyectoSeleccionado" DataTextField="nombreProyecto" DataValueField="idTablaParticipante" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="proyectoSeleccionado_SelectedIndexChanged">
          </asp:DropDownList>
          <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SISTEMADECONVENIOSConnectionString %>' SelectCommand="SELECT idTablaParticipante, nombreProyecto, num_participantes, num_convenio FROM PARTICIPANTE WHERE (num_convenio IS NULL)"></asp:SqlDataSource>
        </div>
      </div>
      <div class="form-row">
        <div class="form-row">
          <asp:Label ID="lbl" runat="server" Text="Número de Participantes:" style="font-size: 0.8571em;margin-bottom: 5px;color: #9A9A9A;"></asp:Label>
          <asp:TextBox ID="txbNumParticipantes" runat="server" TextMode="Number" Style="margin-left: 20px; margin-top: 24px;" Width="335px" Height="41px"></asp:TextBox>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Solo se admiten números" ControlToValidate="txbNumParticipantes" Display="Dynamic" ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
          <asp:RequiredFieldValidator ID="valNumero" runat="server" ErrorMessage=" * Favor de agregar un número" ControlToValidate="txbNumParticipantes" Display="Dynamic" ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
        </div>
      </div>
    </div>
    <asp:Button ID="btnAtras" class="btn btn-primary align-content-center" runat="server" Text="Atras" OnClientClick="btnAtrasClick()" OnClick="btnAtras_Click" Visible="true" />
    <asp:Button ID="btnGuardar" class="btn btn-primary" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
    <div id="mensaje" visible="false" runat="server" class="alert alert-success mt-1" role="alert">
      Guardado
    </div>
  </div>

  <script>
      /*Deshabilitar RequireValidator*/
      function btnAtrasClick() {
          ValidatorEnable(document.getElementById('<%= valNumero.ClientID %>'), false);
      }
  </script>
</asp:Content>
