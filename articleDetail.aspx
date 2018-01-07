<%@ Page Language="C#" AutoEventWireup="true" CodeFile="articleDetail.aspx.cs" Inherits="articleDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>查看文章</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css">
    <link href="style/articleDetail.css" rel="stylesheet">
    <link href="style/index.css" rel="stylesheet">
    <script src="layui/layui.js"></script>
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
                    <li class="layui-nav-item layui-this"><a href="index.aspx">首页</a></li>
                    <li class="layui-nav-item"><a href="">博文</a></li>
                    <li class="layui-nav-item"><a href="">留言板</a></li>
                    <li class="layui-nav-item"><a href="">联系我们</a></li>
                    <li class="layui-nav-item">
                    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/loginUp.aspx">登录</asp:LinkButton></li>
                </ul>
            </div>
        </div>
         </header>
        <div style="margin-top:10px">
            <div class="container article">
                <div class="row" id="containerBody">
                    <div class="col-lg-12 content">
                        <asp:Label ID="Label1" runat="server" class="title"></asp:Label>
                        <br />
                        <div class="contentDetail">
                            <div class="detail2">
                                <asp:Label ID="Label4" runat="server" Text="发表时间："></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text="浏览量："></asp:Label>
                            </div>
                            <div class="detail1">
                                <asp:Label ID="Label2" runat="server" Text="作者："></asp:Label>
                                <asp:Label ID="Label3" runat="server" Text="类型："></asp:Label>
                            </div>
                        </div>
                        <hr />
                        <div class="detail">
                            <asp:Panel ID="Panel1" runat="server">
                            </asp:Panel>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </form>
        <a href="#" id="backToTop" class="cd-top">Top</a>
    <script>
        let a = document.querySelector("#backToTop");
        let header = document.querySelector("header").offsetHeight;
        console.log(header);
        console.log(a);
        function upToTop() {
            //console.log(header + "," + window.scrollY);
            if (window.scrollY > header) {
                a.style.display = 'block';
            } else {
                a.style.display = 'none';
            }
        }
        window.addEventListener("scroll", upToTop);
        layui.use('element', function () {
            var element = layui.element;
        });
    </script>
    <footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 text-center">
                <br>
                <p class="copyright text-muted">
                    Copyright &copy; zl 2017
                    <br>
                    Theme by <a href="">zl</a>
                </p>
            </div>
        </div>
    </div>
</footer>
</body>
</html>
