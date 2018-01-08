<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>博客首页</title>
    <link rel="stylesheet" href="layui/css/layui.css"/>
    <link href="style/index.css" rel="stylesheet"/>
    <script type="text/javascript" src="layui/layui.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet"/>
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
                    <li class="layui-nav-item layui-this"><a style="text-decoration: none;" href="index.aspx">首页</a></li>
                    <li class="layui-nav-item"><a style="text-decoration: none;" href="usersearchArticle.aspx">博文</a></li>
                    <li class="layui-nav-item"><a style="text-decoration: none;" href="AddLiuyan.aspx">留言板</a></li>
                    <li class="layui-nav-item"><a style="text-decoration: none;" href="https://github.com/JocobZling/AspBlog">联系我们</a></li>
                    <li class="layui-nav-item">
                        
                    <asp:LinkButton ID="LinkButton1" runat="server" Text="未登录" style="TEXT-DECORATION: none"></asp:LinkButton>
                        <dl class="layui-nav-child">
                            <dd><asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="~/manageIndex.aspx" Text="管理首页" Visible="false"></asp:LinkButton></dd>
                            <dd><asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/loginUp.aspx" Text="登录"></asp:LinkButton></dd>
                            <dd><asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/changePassword.aspx" Text="修改密码" Visible="false"></asp:LinkButton></dd>
                           <dd> <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/index.aspx" Text="退出" Visible="false"  OnClick="LinkButton4_Click"></asp:LinkButton></dd>                          
                        </dl>
                    </li>
                </ul>
            </div>
        </div>
         </header>
        <div class="logo">
            <img src="image/logo2.png" />
            
        </div>
        <!--轮播图-->
        <div class="container">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="image/index2.jpg" style="height: 500px;" alt="...">
                        <div class="carousel-caption">
                        </div>
                    </div>
                    <div class="item">
                        <img src="image/index1.jpg" style="height: 500px;" alt="...">
                        <div class="carousel-caption">
                        </div>
                    </div>
                    <div class="item">
                        <img src="image/index3.jpg" style="height: 500px;" alt="...">
                        <div class="carousel-caption">
                        </div>
                    </div>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <!--关于我们的介绍-->
            <hr />
            <div class="row" style="margin-top: 40px">
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <img src="image/Me.jpg" alt="">
                        <div class="caption">
                            <h3>徐青青</h3>
                            <p>本组组长负责登录和有关登录的所有内容</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <img src="image/Me.jpg" alt="">
                        <div class="caption">
                            <h3>张玲</h3>
                            <p>本组负责样及发表文章的某人</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <img src="image/Me.jpg" alt="">
                        <div class="caption">
                            <h3>黄子春</h3>
                            <p>本组负责有关评论和留言功能的小美女</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <img src="image/Me.jpg" alt="">
                        <div class="caption">
                            <h3>纪华婷</h3>
                            <p>本组负责有关搜索功能的小美女</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <img src="image/Me.jpg" alt="">
                        <div class="caption">
                            <h3>章萌</h3>
                            <p>本组负责有关管理员相关功能的小美女</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <img src="image/Me.jpg" alt="">
                        <div class="caption">
                            <h3>李文龙</h3>
                            <p>本组。。传说</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <a href="#" style="text-decoration: none;"  id="backToTop" class="cd-top">Top</a>
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
                    Theme by <a href="https://github.com/JocobZling/AspBlog">zl</a>
                </p>
            </div>
        </div>
    </div>
</footer>
</body>
</html>
