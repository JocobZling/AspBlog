<%@ Page Language="C#" AutoEventWireup="true" CodeFile="updateArticle.aspx.cs" Inherits="updateArticle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改文章</title>
    <script src="ckeditor/ckeditor.js" type="text/javascript"></script>
    <script src="ckeditor/config.js" type="text/javascript"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
    <link href="style/addArticle.css" rel="stylesheet">
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
                        <li class="layui-nav-item"><a href="manageIndex.aspx">管理文章和评论</a></li>
                        <li class="layui-nav-item layui-this"><a href="addArticle">添加文章</a></li>
                        <li class="layui-nav-item"><a href="addLiuyan.aspx">管理留言</a></li>
                        <li class="layui-nav-item">
                             <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">退出</asp:LinkButton></li>
                    </ul>
                </div>
            </div>
        </header>
        <div class="space80"></div>
        <div class="container">
            <div class="row">
                <span class="col-lg-1">标题：</span>
                <asp:TextBox ID="TextBox3" runat="server" class="col-lg-2"></asp:TextBox>
                <span class="col-lg-1">分类：</span>
                <asp:DropDownList ID="DropDownList1" runat="server" class="col-lg-1 textbox">
                    <asp:ListItem Value="1">科技</asp:ListItem>
                    <asp:ListItem Value="2">情感</asp:ListItem>
                    <asp:ListItem Value="3">生活</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <div class="col-lg-10">
                    <asp:TextBox ID="TextBox1" runat="server" Rows="10" TextMode="MultiLine"></asp:TextBox>
                    <script type="text/javascript">CKEDITOR.replace('TextBox1');</script>
                    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="保存文章" OnClick="Button1_Click" class="btn-default btn" />
                </div>
            </div>
        </div>
    </form>
    <script>
        layui.use('element', function () {
            var element = layui.element;
        });
    </script>
</body>
</html>
