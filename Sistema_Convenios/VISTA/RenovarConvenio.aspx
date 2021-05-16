<%@ Page Title="" Language="C#" MasterPageFile="~/PagMaestra.Master" AutoEventWireup="true" CodeBehind="RenovarConvenio.aspx.cs" Inherits="VISTA.RenovarConvenio" %>
<%@ import Namespace="MODELO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Titulos" runat="server">
  <h1 class="display-4 mb-2 mx-auto text-center" style="color:aliceblue">Renovar Convenios</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="p-4 m-4 border-top-0">
    <div class="input-group input-group-lg mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text" id="inputGroup-sizing-xsm">Buscar</span>
      </div>
      <asp:TextBox runat="server" ID="txtCriterios" CssClass="form-control" aria-label="Medium" aria-describedby="inputGroup-sizing-md" OnTextChanged="txtCriterios_TextChanged"/>     
    </div>
    <asp:Button ID="btnBuscar" Text="Buscar" CssClass="btn btn-primary mt-1" runat="server" OnClick="btnBuscar_Click" />
    <div class="mt-3">
      <div style="overflow-x:auto;width:100%">
        <asp:GridView ID="gvBuscarConvenios" CssClass="table table-bordered dataTable" AutoGenerateColumns="False" runat="server">
          <Columns>
            <asp:BoundField DataField="numConvenio" HeaderText="Numero del Convenio" />
            <asp:BoundField DataField="nombreInstrumento" HeaderText="Nombre del Instrumento Jurídico" />
            <asp:TemplateField HeaderText="Vigencia del Instrumento Jurídico &#013 Inicio">
              <ItemTemplate>
                <asp:Label ID="lblFechaIni" runat="server" Text='<%# Eval("inicioConvenio", "{0:dd, MMM yyyy}")%>'></asp:Label>
              </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Vigencia del Instrumento Jurídico &#013 Fin">
              <ItemTemplate>    
                <asp:Label ID="lblFechaFin" runat="server" Text='<%# Eval("finConvenio", "{0:dd, MMM yyyy}")%>'></asp:Label>            
              </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Vigencia del Instrumento Jurídico &#013&#013 Plazo en meses">
              <ItemTemplate>
                <asp:Label ID="lblPlazo" runat="server" Text='<%# Eval("plazoConvenio")%>'></asp:Label>
              </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nombreInstitucion" HeaderText="Nombre de la(s) Institucion(es) con la que se suscribe el instrumento jurídico" />
            <asp:TemplateField HeaderText="Renovar">
              <ItemTemplate>
                <asp:LinkButton ID="imgRenovar" runat="server" CommandArgument="<%#((CONVENIO)(Container.DataItem)).numConvenio %>" OnCommand="imgRenovar_Command"><i class="fas fa-sync"></i></asp:LinkButton>
              </ItemTemplate>
            </asp:TemplateField>
          </Columns>
        </asp:GridView>
      </div>
    </div>
  </div>
</asp:Content>