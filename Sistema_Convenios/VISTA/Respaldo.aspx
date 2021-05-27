<%@ Page Title="" Language="C#" MasterPageFile="~/PagMaestra.Master" AutoEventWireup="true" CodeBehind="Respaldo.aspx.cs" Inherits="VISTA.Respaldo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <script src="Include/js/Login.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Titulos" runat="server">
  <h1 class="display-4 mb-2 mx-auto text-center" style="color:aliceblue">Respaldo de Base de Datos</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="p-5">
        <h3>¿Desea realizar un respaldo de la base de datos?</h3>
        <asp:Button ID="btnRespaldo" Text="Descargar Respaldo" CssClass="btn btn-success" runat="server" OnClick="btnRespaldar_Click" />
        <asp:Button ID="btnAtras" Text="Atras" CssClass="btn btn-primary" runat="server" OnClick="btnAtras_Click" />


    </div>
   
</asp:Content>