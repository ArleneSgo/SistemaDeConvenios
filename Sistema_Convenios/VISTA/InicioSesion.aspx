<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InicioSesion.aspx.cs" Inherits="VISTA.InicioSesion" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title>Sistema Convenios</title>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
<!--===============================================================================================-->	
	<link rel="icon" type="Include/images/png" href="Include/images/icons/logo.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Include/vendor/bootstrap/css/bootstrap.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Include/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Include/fonts/Linearicons-Free-v1.0.0/icon-font.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Include/vendor/animate/animate.css"/>
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="Include/vendor/css-hamburgers/hamburgers.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Include/vendor/animsition/css/animsition.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Include/vendor/select2/select2.min.css"/>
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="Include/vendor/daterangepicker/daterangepicker.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Include/css/util.css"/>
	<link rel="stylesheet" type="text/css" href="Include/css/main.css"/>
<!--===============================================================================================-->
   	<script src="Include/js/jquery-3.4.1.min.js"></script>
    <script src="Include/bootstrap/js/bootstrap.min.js"></script>
    <script src="Include/js/Login.js"></script>
</head>
<body>
  <div class="limiter">
    <div class="container-login100">
	  <div class="wrap-login100">
	    <form class="login100-form validate-form" runat="server">
		  <span class="login100-form-title p-b-34">
			Inicio de Sesión
		  </span>
		  <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20" data-validate="Inserte Correo">
			<asp:TextBox ID="txtUsuario" class="input100" runat="server"  placeholder="Email" TextMode="Email" required="true"></asp:TextBox>
		    <span class="focus-input100"></span>
	      </div>
		  <div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20" data-validate="Inserte contraseña">
			<asp:TextBox ID="txtContrasena" class="input100" runat="server"  placeholder="Contraseña" TextMode="Password" required="true"></asp:TextBox>
			<span class="focus-input100"></span>
	      </div>
		  <div class="container-login100-form-btn">
			<asp:Button ID="btnIngresar" CssClass ="login100-form-btn" runat="server" Text="Ingresar" OnClick="btnIngresar_Click"/>
		  </div>
		  <div id="mensajeError" visible="false" runat="server" class="alert alert-danger mt-1" role="alert">
           Correo y/o Contraseña Invalidos
          </div>
		  <div class="w-full text-center p-t-27 p-b-239">
		  </div>
        </form>
		<div class="login100-more" style="background-image: url('Include/images/venadoITH.jpg');"></div>
		</div>
	  </div>
	</div>
  <div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="Include/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="Include/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="Include/vendor/bootstrap/js/popper.js"></script>
	<script src="Include/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
        $(".selection-2").select2({
            minimumResultsForSearch: 20,
            dropdownParent: $('#dropDownSelect1')
        });
    </script>
<!--===============================================================================================-->
	<script src="Include/vendor/daterangepicker/moment.min.js"></script>
	<script src="Include/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="Include/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="Include/js/main.js"></script>

</body>
</html>