<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddLiuyan.aspx.cs" Inherits="AddLiuyan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title></title>
    <style type="text/css">
        .auto-style1
        {
            width: 30%;
            margin-left: 224px;
        }
        .auto-style3
        {
            width: 26px;
        }
        .auto-style4
        {
            width: 87px;
        }
        .auto-style5
        {
            width: 87px;
            height: 23px;
        }
        .auto-style6
        {
            width: 26px;
            height: 23px;
        }
    </style>
</head>
<body style="background-image:url(2.jpg)">
    <form id="form1" runat="server">
    <div style="text-align:center;" >
    
        <asp:Panel ID="Panel1" runat="server" Height="75px" HorizontalAlign="Center">
            <table align="center" valign="center">
                <tr>
                    <td class="auto-style4">标题：</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">收件人：</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">留言：</td>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
    
    &nbsp;<br />
        <asp:TextBox ID="TextBox1" runat="server" Height="218px" OnTextChanged="TextBox1_TextChanged" TextMode="MultiLine" Width="534px"></asp:TextBox>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Height="27px" OnClick="Button1_Click" Text="确定" Width="59px" BorderColor="#66FFFF" />
    
    </div>
    </form>
</body>
</html>

