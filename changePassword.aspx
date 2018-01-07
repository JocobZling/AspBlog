<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changePassword.aspx.cs" Inherits="changePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
   <form id="form1" runat="server">
       <div style="padding-left:500px;padding-top:100px">
        
        <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 修改密码</h3>
   
        
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    &nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Text="原密码："></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="原密码不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;&nbsp;
                    <asp:Label ID="Label2" runat="server" Text="新密码："></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="新密码不能为空 "></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;<asp:Label ID="Label3" runat="server" Text="确认密码："></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="确认密码不能为空"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox3" ControlToCompare="TextBox2"  ErrorMessage="新密码与确认密码不一致"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
&nbsp; 
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确认"/>
                &nbsp;<asp:Button ID="Button2" runat="server" Text="返回" CausesValidation="False" OnClick="Button2_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
   
        </div>
    </form>
</body>
</html>
