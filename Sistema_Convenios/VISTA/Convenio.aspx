<%@ Page Title="" Language="C#" MasterPageFile="~/PagMaestra.Master" AutoEventWireup="true" CodeBehind="Convenio.aspx.cs" Inherits="VISTA.Convenio" %>
<%@ import Namespace="MODELO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <script src="Include/js/Login.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Titulos" runat="server">
  <h1 class="display-4 mb-2 mx-auto text-center" style="color:aliceblue">Modificar Convenio</h1>
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
          <asp:BoundField DataField="nombreRepITH" HeaderText="Nombre del Representante del IT que suscribió el instrumento jurídico" />
          <asp:BoundField DataField="nombreInstitucion" HeaderText="Nombre de la(s) Institucion(es) con la que se suscribe el instrumento jurídico" />
          <asp:BoundField DataField="nombreRepInstitucion" HeaderText="Nombre del Representante de la Institución con la que se suscribe el instrumento jurídico" />
          <asp:BoundField DataField="cargoRepInstitucion" HeaderText="Cargo del Representante de la Institución con la que se suscribe el instrumento jurídico" />
          <asp:TemplateField HeaderText="Acciones">
            <ItemTemplate>
              <asp:LinkButton ID="imgModificar" runat="server" CommandArgument="<%#((CONVENIO)(Container.DataItem)).numConvenio %>" OnCommand="imgModificar_Command"><i class="fas fa-edit"></i></asp:LinkButton>
              &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              <asp:LinkButton ID="imgEliminar" runat="server" CommandArgument="<%#((CONVENIO)(Container.DataItem)).numConvenio %>" OnCommand="imgEliminar_Command"><i class="fas fa-trash-alt"></i></asp:LinkButton>
            </ItemTemplate>
          </asp:TemplateField>
        </Columns>
      </asp:GridView>
    </div>
    <div class="modal fade" id="modalEliminar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">¡Atención!</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
          </div>
          <div class="modal-body">
            <asp:HiddenField ID="hiddenId" runat="server" value="0"/>
                    ¿Estás seguro que deseas eliminar este convenio?       
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar </button>
            <asp:Button type="button" class="btn btn-primary"  runat="server" OnCommand="eliminar_Command"  Text="Eliminar"/>
          </div>
        </div>
      </div>
    </div>
  </div>             
</div> 
</asp:Content>