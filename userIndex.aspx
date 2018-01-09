<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userIndex.aspx.cs" Inherits="userIndex" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>修改个人信息</title>

    <link rel="stylesheet" href="css/supersized.css" />
    <link rel="stylesheet" href="css/login.css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
	<script src="js/html5.js"></script>
<![endif]-->
    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/tooltips.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 581px;
        }

        .auto-style6 {
            width: 717px
        }

        .auto-style7 {
            width: 717px;
            height: 33px;
        }

        .auto-style8 {
            width: 734px
        }
    </style>

</head>

<body>
    <form id="form" runat="server">
        <div style="padding-left: 500px; padding-top: 100px">
            &nbsp;个人信息：<br />

            <table>
                <tr class="auto-style1">
                    <td class="auto-style7">头像：<asp:Image ID="Image1" runat="server" />
                        <asp:FileUpload ID="FileUpimage" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">账号：<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">姓名：<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">性别：<asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">生日：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">地址：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">工作：<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">爱好：<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">血型：<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style6">邮箱：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="邮箱不能为空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
            <br />

            &nbsp;&nbsp;&nbsp;

            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="修改" />
            &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" CausesValidation="False" OnClick="Button2_Click" Text="返回" />
        </div>
    </form>
    <script type="text/javascript" src="js/supersized.3.2.7.min.js"></script>
<script type="text/javascript" src="js/supersized-init.js"></script>
<script type="text/javascript" src="js/scripts.js"></script>
</body>

</html>
