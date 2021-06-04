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
          <asp:Repeater ID="Repeater1" runat="server">
              <HeaderTemplate>
                    <h6>Participantes</h6>
                  <div class="form-row">
                      <div class="col-md-6">
                          Nombre de Participante
                      </div>
                      <div class="col-md-3">
                          Carrera de Participante
                      </div>
                  </div>
              </HeaderTemplate>
              <ItemTemplate>
                  <div class="form-row mb-3">
                      <div class="col-md-6">
                        <asp:TextBox ID="Nombre" runat="server" CssClass="form-control border-dark"></asp:TextBox>
                      </div>
                      <div class="col-md-3">
                        <asp:DropDownList ID="CarreraDDL" runat="server" CssClass="form-control border-dark">
                          <asp:ListItem Value="">Seleccionar</asp:ListItem>
                          <asp:ListItem Value="ING. AERONÁUTICA">ING. AERONÁUTICA</asp:ListItem>
                          <asp:ListItem Value="ING. BIOMÉDICA">ING. BIOMÉDICA</asp:ListItem>
                          <asp:ListItem Value="ING. ELÉCTRICA">ING. ELÉCTRICA</asp:ListItem>
                          <asp:ListItem Value="ING. ELECTRÓNICA">ING. ELECTRÓNICA</asp:ListItem>
                          <asp:ListItem Value="ING. INDUSTRIAL">ING. INDUSTRIAL</asp:ListItem>
                          <asp:ListItem Value="ING. MECÁNICA">ING. MECÁNICA</asp:ListItem>
                          <asp:ListItem Value="ING. MECATRÓNICA">ING. MECATRÓNICA</asp:ListItem>
                          <asp:ListItem Value="LIC. ADMINISTRACIÓN">LIC. ADMINISTRACIÓN</asp:ListItem>
                          <asp:ListItem Value="ING. SISTEMAS COMPUTACIONALES">ING. SISTEMAS COMPUTACIONALES</asp:ListItem>
                          <asp:ListItem Value="ING. INFORMÁTICA">ING. INFORMÁTICA</asp:ListItem>
                          <asp:ListItem Value="ING. GESTIÓN EMPRESARIAL">ING. GESTIÓN EMPRESARIAL</asp:ListItem>
                        </asp:DropDownList>
                      </div>
                  </div>
              </ItemTemplate>
          </asp:Repeater>
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
      }
  </script>
</asp:Content>
