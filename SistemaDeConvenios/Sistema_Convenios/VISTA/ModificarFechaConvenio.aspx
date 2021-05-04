<%@ Page Title="" Language="C#" MasterPageFile="~/PagMaestra.Master" AutoEventWireup="true" CodeBehind="ModificarFechaConvenio.aspx.cs" Inherits="VISTA.ModificarFechaConvenio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Titulos" runat="server">
  <h1 class="display-4 mb-2 mx-auto text-center" style="color:aliceblue">Renovar Convenio</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div  class="container mp-5 mt-4" >
    <div id="contactanosFormulario" class="contactanosFormulario">
      <div class="form-row">
        <label for="txtNumConv">Numero del Convenio:</label>
        <div class="form-row">
          <asp:TextBox ID="txbNumConvenio" runat="server" Style="margin-left: 20px; margin-top: 24px;"
            Width="335px" Height="41px" ReadOnly="true">
          </asp:TextBox> 
        </div>
        <div class="form-row">
          <label for="txtInicio">Fecha de inicio:</label>
          <asp:TextBox ID="txbFechaInicio" runat="server" Style="margin-left: 20px; margin-top: 24px;"
            Width="335px" Height="41px" TextMode ="Date" OnTextChanged="txbFecha_TextChanged" AutoPostBack="true"></asp:TextBox> 
        </div>
        <div class="form-row">
          <label for="txtFin">Fecha de termino:</label>
          <asp:TextBox ID="txbFechaFin" runat="server" Style="margin-left: 20px; margin-top: 24px;"
            Width="335px" Height="41px" TextMode="Date" OnTextChanged="txbFecha_TextChanged" AutoPostBack="true">
          </asp:TextBox> 
          <asp:CompareValidator ID="CompareValidator1"
                ControlToCompare="txbFechaInicio"
                ControlToValidate="txbFechaFin"
                Display="Dynamic"
                ErrorMessage=" * La fecha de fin debe ser mayor a la de inicio"
                Operator="GreaterThanEqual"
                Type="Date"
                runat="server" ForeColor="Red" >
          </asp:CompareValidator>   
        </div>
        <div class="form-row">
          <label for="txtPlConv">Plazo del Convenio:</label>
          <asp:TextBox ID="txbPlazo" runat="server" Style="margin-left: 20px; margin-top: 24px;"
            Width="335px" Height="41px" ReadOnly="true"></asp:TextBox> 
        </div>
      </div>
      <asp:Button ID="btnAtras" class="btn btn-primary align-content-center" runat="server" Text="Atras" 
        OnClick="btnAtras_Click" Visible="true" />
      <asp:Button ID="btnGuardar" class="btn btn-primary" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
      <div id="mensaje" visible="false" runat="server" class="alert alert-success mt-1" role="alert">
        Guardado
      </div>
    </div>
  </div>
</asp:Content>