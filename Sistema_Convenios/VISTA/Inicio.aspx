<%@ Page Title="" Language="C#" MasterPageFile="~/PagMaestra.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="VISTA.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Titulos" runat="server">
  <h1 class="display-4 mb-2 mx-auto text-center" style="color:aliceblue">Sistema Convenios</h1>
  <h3 class="display-6 mb-2 mx-auto text-center" style="color:aliceblue">Convenios Por Expirar</h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="p-4 m-4 border-top-0">
    <div class="mt-3">
      <h3 class="display-6 mb-2 mx-auto text-center" runat="server" id="lblNohay" visible="false"> No hay Convenios próximos a vencer actualmente. </h3>
      <div style="overflow-x:auto;width:100%">
        <asp:GridView ID="gvBuscarConvenios" CssClass="table table-bordered dataTable" AutoGenerateColumns="False" runat="server" DataSourceID="SqlDataSource1">
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
          </Columns>
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SISTEMADECONVENIOSConnectionString %>' SelectCommand="SELECT numConvenio, nombreInstrumento, inicioConvenio, finConvenio, plazoConvenio, nombreInstitucion FROM CONVENIO WHERE (finConvenio > @fecha) AND (finConvenio < @fecha2)">
          <SelectParameters>
            <asp:ControlParameter ControlID="Calendar1" PropertyName="SelectedDate" DefaultValue="2000/01/01 00:00:00" Name="fecha"></asp:ControlParameter>
            <asp:ControlParameter ControlID="Calendar2" PropertyName="SelectedDate" DefaultValue="2030/12/30 00:00:00" Name="fecha2"></asp:ControlParameter>
          </SelectParameters>
        </asp:SqlDataSource>
        <asp:EntityDataSource runat="server" ID="EntityDataSource1"></asp:EntityDataSource>
      </div>
      <asp:Calendar Visible="false" CssClass="form-control" ID="Calendar1" runat="server" ></asp:Calendar>
      <asp:Calendar Visible="false" CssClass="form-control" ID="Calendar2" runat="server" SelectedDate="2040/01/01 00:00:00"></asp:Calendar>
    </div>  
  </div>
</asp:Content>