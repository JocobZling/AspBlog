<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manageIndex.aspx.cs" Inherits="manageIndex" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>管理员首页</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
    <link href="style/manageIndex.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <header>
        <div class="layui-header header">
            <div class="main">
                <a href="index.aspx"><span class="logoText">Blog</span></a>
                <ul class="layui-nav">
                    <li class="layui-nav-item layui-this"><a href="manageIndex.aspx">管理文章和评论</a></li>
                    <li class="layui-nav-item "><a href="addArticle.aspx">添加文章</a></li>
                    <li class="layui-nav-item"><a href="">管理留言</a></li>
                    <li class="layui-nav-item">
                        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/index.aspx">退出</asp:LinkButton></li>
                </ul>
            </div>
        </div>
       </header>
        <script>
            layui.use('element', function () {
                var element = layui.element;
            });
        </script>

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" SelectedIndex="0">
             <Columns>
                <asp:CommandField ShowSelectButton="True" HeaderText="管理" />
                <asp:BoundField DataField="Title" HeaderText="文章标题" SortExpression="Title" />
                <asp:BoundField DataField="A_Content" HeaderText="文章概要" SortExpression="A_Content">
                <ItemStyle Width="800px" />
                </asp:BoundField>
                <asp:BoundField DataField="PublishedTime" HeaderText="发布时间" SortExpression="PublishedTime" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BlogConnectionString %>" SelectCommand="SELECT [Title], [A_Content], [PublishedTime] FROM [Articles]"></asp:SqlDataSource>
    </form>
</body>
</html>
