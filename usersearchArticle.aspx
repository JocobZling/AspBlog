<%@ Page Language="C#" AutoEventWireup="true" CodeFile="usersearchArticle.aspx.cs" Inherits="usersearchArticle" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>博文列表</title>
    <link rel="stylesheet" href="layui/css/layui.css" />
    <link href="style/index.css" rel="stylesheet" />
    <link href="style/userSearchArticleCss.css" rel="Stylesheet" />
    <script type="text/javascript" src="layui/layui.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <header>
        <div class="layui-header header">
            <div class="main">
                <a href="index.aspx"><span class="logoText">Blog</span></a>
                <ul class="layui-nav">
                    <li class="layui-nav-item"><a href="index.aspx">首页</a></li>
                    <li class="layui-nav-item layui-this"><a href="usersearchArticle.aspx">博文</a></li>
                    <li class="layui-nav-item"><a href="AddLiuyan.aspx">留言板</a></li>
                    <li class="layui-nav-item"><a href="">联系我们</a></li>
                    <li class="layui-nav-item">
                        
                    <asp:LinkButton ID="LinkButton1" runat="server" Text="未登录" style="TEXT-DECORATION: none"></asp:LinkButton>
                    </li>
                </ul>
            </div>
        </div>
         </header>
        <div class="container">
            <div class="row">
                <span class="layui-icon col-lg-2" style="font-size: 25px; color: grey">搜索 &#xe615</span>
                <asp:TextBox ID="TextBox1" placeholder="搜索" class="layui-input col-lg-2" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="" OnClick="Button1_Click1" BackColor="White" />
                <script type="text/javascript">  
                    //回车事件
                    function keyDown() {
                        var e = event.srcElement;
                        if (event.keyCode == 13) {
                            document.getElementById("Button1").click();
                        }
                    }

                    layui.use('element', function () {
                        var element = layui.element;
                    });

                </script>
            </div>
            <div class="row">
                <div class="col-lg-8 searchRow">
                    <asp:Panel ID="Panel1" runat="server">
                    </asp:Panel>
                </div>
                <div class="col-lg-4 searchComment">
                    <asp:Panel ID="Panel2" runat="server">
                    </asp:Panel>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
