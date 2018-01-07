<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminsearchArticle.aspx.cs" Inherits="adminsearchArticle" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="Stylesheet" type="text/css" />
</head>
<body>
     <form id="form1" runat="server"><center>
     <div id="head">
         <img src="head.jpg" height="300" alt="head"/>
         </div>
     <div id="body">

        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="搜索" />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label> 
    
        <asp:HyperLink ID="HyperLink1" runat="server"></asp:HyperLink>
        <asp:Label ID="Label2" runat="server"></asp:Label>
    
        <br />
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="修改文章" />
        <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="删除文章" />
        <br />
        <asp:Label ID="Label3" runat="server"></asp:Label>
    
    </div>
    <div id="tail">
        <img src="tail.jpg" height="300" alt="head"/>
    </div>
    </form></center>
</body>
</html>
