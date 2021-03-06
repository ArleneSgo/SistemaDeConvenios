<%@ Page Title="" Language="C#" MasterPageFile="~/PagMaestra.Master" AutoEventWireup="true" CodeBehind="Participantes.aspx.cs" Inherits="VISTA.Participantes" %>
<%@ Import Namespace="MODELO" %>
<%@ Import  Namespace="System.Collections.Generic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Titulos" runat="server">
  <h1 class="display-4 mb-2 mx-auto text-center" style="color:aliceblue">Participantes</h1>
    <div class="row">
        <div class="col-lg-5 mx-auto" >
            <a href="AgregarParticipantes.aspx" class="btn btn-sq-lg btn-primary btn-block">
                <i class="now-ui-icons  ui-1_simple-add"></i>
                <label style="font-size:18px">Nuevo Proyecto</label>
            </a>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="p-4 m-4 border-top-0">
    <div class="card">
      <ul class="nav nav-tabs">
        <li class="nav-item">
          <a class="nav-link active" href="#!">Convenios</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ParticipantesRegistrados.aspx">Proyectos</a>
        </li>
      </ul>
      <div class="card-body" >
        <div class="input-group input-group-lg mb-3">
          <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-xsm">Buscar</span>
          </div>
          <asp:TextBox runat="server" ID="txtCriterios" CssClass="form-control" aria-label="Medium" aria-describedby="inputGroup-sizing-md" OnTextChanged="txtCriterios_TextChanged"/>
        </div>
        <asp:Button ID="btnBuscar" Text="Buscar" CssClass="btn btn-primary mt-1" runat="server" OnClick="btnBuscar_Click" />
        <div class="mt-3">
          <asp:GridView ID="gvConvenios" CssClass="table table-bordered dataTable" runat="server" AutoGenerateColumns="false">
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
              <asp:BoundField DataField="num_participantes" HeaderText="Numero de Participantes" />
              <asp:TemplateField HeaderText="Carreras">
                <ItemTemplate>
                    <asp:Repeater runat="server" DataSource="<%# ((CONVENIO)Container.DataItem).PARTICIPANTE.SelectMany(p => p.PARTICIPANTE_CARRERA).GroupBy(pc => pc.nombreCarrera).Select(g => new {name=g.Key, count=g.Count() }).Where(g => g.name.Length > 0) %>">
                        <ItemTemplate>
                            <b><asp:Label runat="server" Text='<%# Eval("name") %>'></asp:Label>:</b> <asp:Label runat="server" Text='<%# Eval("count") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:Repeater>
                </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                  <asp:LinkButton ID="imgAgregar"  runat="server" CommandArgument="<%#((CONVENIO)(Container.DataItem)).numConvenio%>" OnCommand="imgAgregar_Command"><i class="now-ui-icons  ui-1_simple-add"></i></asp:LinkButton>
                </ItemTemplate>
              </asp:TemplateField>
            </Columns>
          </asp:GridView>
        </div>
      </div>
    </div>
  </div>
</asp:Content>