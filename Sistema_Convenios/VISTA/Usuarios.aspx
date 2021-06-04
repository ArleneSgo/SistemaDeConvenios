<%@ Page Title="" Language="C#" MasterPageFile="~/PagMaestra.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="VISTA.Usuarios" %>
<%@ import Namespace="MODELO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <script src="Include/js/Login.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Titulos" runat="server">
  <h1 class="display-4 mb-2 mx-auto text-center" style="color:aliceblue">Administrador de Usuarios</h1>
    <div class="row">
    <div class="col-lg-5 mx-auto" >
        <a href="AgregarUsuario.aspx" class="btn btn-sq-lg btn-primary btn-block">
            <i class="now-ui-icons  ui-1_simple-add"></i>
            <label style="font-size:18px">Crear Usuario</label>
        </a>
    </div>
    </div>
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
      <asp:GridView ID="gvBuscarUsuarios" CssClass="table table-bordered dataTable" AutoGenerateColumns="False" runat="server">
        <Columns>
          <asp:TemplateField HeaderText="Rol" >          
            <ItemTemplate>
              <asp:Label ID="lblRol" runat="server"  Text='<%# string.Format("{0}", Eval("tipoUsuario").ToString() == "1" ? "Administrador" : "Area") %>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Nombre Completo">
            <ItemTemplate>
              <asp:Label ID="lblNombre" runat="server" Text='<%# string.Format("{0} {1} {2}", Eval("nombre"), Eval("primer_apellido"), Eval("segundo_apellido"))%>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>
          <asp:BoundField DataField="email" HeaderText="Correo Electronico" />
          <asp:TemplateField HeaderText="Telefono">          
            <ItemTemplate>
              <asp:Label ID="lblTelefono" runat="server"  Text='<%# string.Format("{0}", Eval("telefono"))%>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>
          <asp:BoundField DataField="empresa" HeaderText="Empresa/Institución" />
          <asp:TemplateField HeaderText="Acciones">
            <ItemTemplate>
              <asp:LinkButton ID="imgModificar" runat="server" CommandArgument="<%#((USUARIO)(Container.DataItem)).id_usuario %>" OnCommand="imgModificar_Command"><i class="fas fa-edit"></i></asp:LinkButton>
              <asp:LinkButton ID="imgEliminar" runat="server" CommandArgument="<%#((USUARIO)(Container.DataItem)).id_usuario %>" OnCommand="imgEliminar_Command"><i class="fas fa-trash-alt"></i></asp:LinkButton>
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
            ¿Estás seguro que deseas eliminar este usuario?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar </button>
            <asp:Button type="button" class="btn btn-primary"  runat="server" OnCommand="eliminar_Command"  Text="Eliminar"/>
          </div>
        </div>
      </div>
    </div>
  </div>
</asp:Content>