<%@ Page Language="C#" AutoEventWireup="true" CodeFile="resetPassword.aspx.cs" Inherits="resetPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 356px;
        }
    </style>
<link rel="stylesheet" href="css/supersized.css"/>
<link rel="stylesheet" href="css/login.css"/>
<link href="css/bootstrap.min.css" rel="stylesheet"/>
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	<script src="js/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>
<script type="text/javascript" src="js/tooltips.js"></script>
<script type="text/javascript" src="js/login.js"></script>
</head>
<body>
  <div class="page-container">
	&nbsp;<div class="main_box">
		<div class="login_box">
			<div class="login_form">
				<form id="login_form" runat="server">
					<div class="form-group"> 
    <h3>重置密码</h3>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="账号："></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="新密码："></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="新密码不能为空"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="确认密码："></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="确认密码不能为空"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox1" ControlToValidate="TextBox2" ErrorMessage="确认密码与新密码不一致"></asp:CompareValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确认" />
                &nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" Text="返回" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
 </div>							
				</form>
			</div>
		</div>
	</div>
</div>
    <!-- Javascript -->

<script type="text/javascript" src="js/supersized.3.2.7.min.js"></script>
<script type="text/javascript" src="js/supersized-init.js"></script>
<script type="text/javascript" src="js/scripts.js"></script>
</body>
</html>


