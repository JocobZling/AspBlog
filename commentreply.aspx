<%@ Page Language="C#" AutoEventWireup="true" CodeFile="commentreply.aspx.cs" Inherits="commentreply" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="background-image:url(2.jpg)">
    <form id="form1" runat="server">
    <div style="text-align:center;" >
    
        回复内容：<br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="216px" style="margin-top: 0px" TextMode="MultiLine" Width="560px"></asp:TextBox>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
    
    </div>
        <asp:Panel ID="Panel1" runat="server" Height="24px" HorizontalAlign="Center">
            <asp:Button ID="Button1" runat="server" Height="21px" OnClick="Button1_Click" style="margin-left: 0px" Text="确定" Width="66px" />
        </asp:Panel>
    </form>
</body>
</html>
