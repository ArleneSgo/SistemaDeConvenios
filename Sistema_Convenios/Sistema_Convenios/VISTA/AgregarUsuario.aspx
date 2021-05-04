<%@ Page Title="" Language="C#" MasterPageFile="~/PagMaestra.Master" AutoEventWireup="true" CodeBehind="AgregarUsuario.aspx.cs" Inherits="VISTA.AgregarUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Titulos" runat="server">
  <h1 class="display-4 mb-2 mx-auto text-center" style="color:aliceblue">Agregar Usuario</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div  class="container mp-5 mt-4" >
    <div id="contactanosFormulario" class="contactanosFormulario">
      <div class="form-row">        
        <div class="form-group col-md-4">
          <label for="inputZip">Rol de Usuario</label>
          <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" id="rbtn">
            <asp:ListItem Value="1">&nbsp&nbspAdministrador&nbsp&nbsp&nbsp&nbsp</asp:ListItem>
            <asp:ListItem Selected="True" Value="2">&nbsp&nbspEncargado de Área&nbsp&nbsp</asp:ListItem>
          </asp:RadioButtonList>
        </div>
      </div>
      <div class="form-row" >
        <div class="form-group col-md-4">
          <label>Nombre</label>
          <asp:TextBox ID="txtNombre" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Campo Requerido" ControlToValidate="txtNombre" 
          Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="* Formato Incorrecto Solo Se Permiten Letras " 
          ControlToValidate="txtNombre" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-Z ]{1,}$"></asp:RegularExpressionValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="* Tamaño inválido, favor de ingresar el nombre 
          correctamente " ControlToValidate="txtNombre" Display="Dynamic" ForeColor="Red" ValidationExpression=".{2}.*"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group col-md-4">
          <label >Primer Apellido</label>
          <asp:TextBox ID="txtPrimerApellido" class="form-control"  runat="server" MaxLength="50"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Campo Requerido" ControlToValidate="txtPrimerApellido" 
          Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="* Formato Incorrecto Solo Se Permiten Letras " 
          ControlToValidate="txtPrimerApellido" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-Z ]{1,}$"></asp:RegularExpressionValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="* Tamaño inválido, favor de ingresar el apellido 
          correctamente " ControlToValidate="txtPrimerApellido" Display="Dynamic" ForeColor="Red" ValidationExpression=".{2}.*"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group col-md-4">
          <label >Segundo Apellido</label>
          <asp:TextBox ID="txtSegundoApellido" class="form-control"  runat="server" MaxLength="50"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Campo Requerido" ControlToValidate="txtSegundoApellido" 
          Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="* Formato Incorrecto Solo Se Permiten Letras " 
          ControlToValidate="txtSegundoApellido" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-Z ]{1,}$"></asp:RegularExpressionValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="* Tamaño inválido, favor de ingresar el apellido 
          correctamente " ControlToValidate="txtSegundoApellido" Display="Dynamic" ForeColor="Red" ValidationExpression=".{2}.*"></asp:RegularExpressionValidator>
        </div>
      </div>
      <div class="form-row">
        <div class="form-group col-md-4">
          <label for="inputAddress">Correo Electronico</label>
          <asp:TextBox ID="txtCorreoElectronico" class="input100" CssClass="form-control" placeholder="ejemplo@dominio.com" runat="server" TextMode="Email"
          MaxLength="50" ></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="* Campo Requerido" ControlToValidate="txtCorreoElectronico"
          Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ErrorMessage="* Formato incorrecto " 
          ControlToValidate="txtCorreoElectronico" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group col-md-4">
          <label for="inputAddress">Telefono</label>
          <asp:TextBox ID="txtTelefono" CssClass="form-control"  runat="server" MaxLength="10"></asp:TextBox>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="* Formato Incorrecto 10 números" 
          ControlToValidate="txtTelefono" Display="Dynamic" ForeColor="Red" ValidationExpression="^[\d]{10}$"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group col-md-4">
          <label for="inputAddress">Empresa/Institución</label>
          <asp:TextBox ID="txtEmpresa" CssClass="form-control"  runat="server" MaxLength="50"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="* Campo Requerido" ControlToValidate="txtEmpresa" 
          Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="* Tamaño inválido, favor de ingresar el nombre 
          de la empresa correctamente " ControlToValidate="txtEmpresa" Display="Dynamic" ForeColor="Red" ValidationExpression=".{2}.*"></asp:RegularExpressionValidator>
        </div>
      </div>
      <div class="form-row">
        <div class="form-group col-md-6">
          <label for="inputAddress">Contraseña</label>
          <asp:TextBox ID="txtContrasena" CssClass="form-control" TextMode="Password"  runat="server"  MaxLength="5"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvContrasena" runat="server" ErrorMessage="* Campo Requerido" ControlToValidate="txtContrasena" 
          Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ErrorMessage="* Formato Incorrecto 1 May 5 Caracteres"
          ControlToValidate="txtContrasena" Display="Dynamic" ForeColor="Red" ValidationExpression="[A-Z]\w{4}"></asp:RegularExpressionValidator>
        </div>  
      </div>
      <asp:Button ID="btnAtras" class="btn btn-primary align-content-center" runat="server" Text="Atras" OnClick="btnAtras_Click" Visible="true" />
      <asp:Button ID="btnGuardar" class="btn btn-primary" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
      <div id="mensaje" visible="false" runat="server" class="alert alert-success mt-1" role="alert">
                          Guardado
      </div>
    </div>
  </div>  	
</asp:Content>
