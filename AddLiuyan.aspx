<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddLiuyan.aspx.cs" Inherits="AddLiuyan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title>留言板</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css">
    <link href="style/articleDetail.css" rel="stylesheet">
    <link href="style/index.css" rel="stylesheet">
    <script src="layui/layui.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>


    <style type="text/css">
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

<body>
    <form id="form1" runat="server">

        <header>
        <div class="layui-header header">
            <div class="main">
                <a href="index.aspx"><span class="logoText">Blog</span></a>
                <ul class="layui-nav">
                    <li class="layui-nav-item "><a style="text-decoration: none;" href="index.aspx">首页</a></li>
                    <li class="layui-nav-item"><a style="text-decoration: none;" href="usersearchArticle.aspx">博文</a></li>
                    <li class="layui-nav-item layui-this"><a style="text-decoration: none;" href="AddLiuyan.aspx">留言板</a></li>
                    <li class="layui-nav-item"><a style="text-decoration: none;" href="https://github.com/JocobZling/AspBlog">联系我们</a></li>
                    <li class="layui-nav-item">
                    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/loginUp.aspx">登录</asp:LinkButton></li>
                </ul>
            </div>
        </div>
         </header>

    <div style="text-align:center; margin-top:20px" >
    
        <asp:Panel ID="Panel1" runat="server" Height="75px" HorizontalAlign="Center">
            <table align="center" valign="center">
                <tr>
                    <td class="auto-style4">标题：</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style6">
                        &nbsp;</td>
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
    
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    
    </div>

        <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BlogConnectionString %>" SelectCommand="SELECT * FROM [Messages] ORDER BY [AddDate] DESC">
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Msg_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Msg_User" SortExpression="Msg_User" />
               
                <asp:HyperLinkField  Text="：" />
                <asp:BoundField DataField="Msg_Title" SortExpression="Msg_Title"  ItemStyle-Width="150px" ItemStyle-Height="50">
<ItemStyle Height="50px" Width="150px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Msg_Content" SortExpression="Msg_Content" ItemStyle-Width="150px" ItemStyle-Height="50">
                
                
<ItemStyle Height="50px" Width="150px"></ItemStyle>
                </asp:BoundField>
                
                
                <asp:BoundField DataField="AddDate" SortExpression="AddDate" ItemStyle-Width="100px" ItemStyle-Height="100"> 
<ItemStyle Height="100px" Width="100px"></ItemStyle>
                </asp:BoundField>
                <asp:HyperLinkField  Text="回复" DataNavigateUrlFields="Msg_ID" DataNavigateUrlFormatString="messagereply.aspx?Msg_ID={0}" ItemStyle-Width="100px" ItemStyle-Height="50">
<ItemStyle Height="50px" Width="100px"></ItemStyle>
                </asp:HyperLinkField>
                <asp:BoundField DataField="Reply" SortExpression="Reply" ItemStyle-Width="150px" ItemStyle-Height="50">
<ItemStyle Height="50px" Width="150px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="ReplyData" SortExpression="ReplyData" ItemStyle-Width="100px">
               
                
<ItemStyle Width="100px"></ItemStyle>
                </asp:BoundField>
               
                
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Panel ID="Panel2" runat="server" Height="41px" HorizontalAlign="Center">
        </asp:Panel>
    
    </div>
    </form>
    <script>
        layui.use('element', function () {
            var element = layui.element;
        });
    </script>
</body>
</html>

