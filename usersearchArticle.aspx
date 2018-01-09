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
                    <li class="layui-nav-item"><a style="text-decoration: none;" href="index.aspx">首页</a></li>
                    <li class="layui-nav-item layui-this"><a  style="text-decoration: none;" href="usersearchArticle.aspx">博文</a></li>
                    <li class="layui-nav-item"><a style="text-decoration: none;" href="AddLiuyan.aspx">留言板</a></li>
                    <li class="layui-nav-item"><a style="text-decoration: none;" href="https://github.com/JocobZling/AspBlog">联系我们</a></li>
                    <li class="layui-nav-item">
                        
                    <asp:LinkButton ID="LinkButton1" runat="server" Text="未登录" style="TEXT-DECORATION: none"></asp:LinkButton>
                        <dl class="layui-nav-child">
                            <dd><asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="~/manageIndex.aspx" Text="管理首页" Visible="false"></asp:LinkButton></dd>
                            <dd><asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/loginUp.aspx" Text="登录"></asp:LinkButton></dd>
                            <dd><asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/changePassword.aspx" Text="修改密码" Visible="false"></asp:LinkButton></dd>
                           <dd> <asp:LinkButton ID="LinkButton4" runat="server"  Text="退出" Visible="false"  OnClick="LinkButton4_Click"></asp:LinkButton></dd>                          
                        </dl>
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
                    <ul class="layui-nav layui-nav-tree" lay-filter="test">
                        <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
                        <li class="layui-nav-item layui-nav-itemed">
                            <a href="javascript:;">分类</a>
                            <dl class="layui-nav-child">
                                <dd>

                                    <asp:HyperLink Style="text-decoration: none;" ID="HyperLink4" runat="server" NavigateUrl="~/usersearchArticle.aspx">全部</asp:HyperLink>

                                </dd>
                                <dd>
                                    <asp:HyperLink Style="text-decoration: none;" ID="HyperLink1" runat="server" NavigateUrl="~/userSearch1.aspx">科技</asp:HyperLink></dd>

                                <dd>
                                    <asp:HyperLink Style="text-decoration: none;" ID="HyperLink2" runat="server" NavigateUrl="~/userSearch2.aspx">情感</asp:HyperLink></dd>

                                <dd>
                                    <asp:HyperLink Style="text-decoration: none;" ID="HyperLink3" runat="server" NavigateUrl="~/userSearch3.aspx">生活</asp:HyperLink></dd>

                            </dl>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="space80"></div>
        <footer>
           <a href="#" style="text-decoration: none;" id="backToTop" class="cd-top">Top</a>
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
    </form>
</body>
</html>
