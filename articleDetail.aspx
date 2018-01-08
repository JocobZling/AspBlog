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
                    <li class="layui-nav-item "><a href="index.aspx">首页</a></li>
                    <li class="layui-nav-item layui-this"><a href="usersearchArticle.aspx">博文</a></li>
                    <li class="layui-nav-item"><a href="addLiuyan.aspx">留言板</a></li>
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
       




         <asp:Panel ID="Panel2" runat="server" Height="24px" HorizontalAlign="Center">
           

              <div style="text-align:center; height: 296px;" >
    
        评论内容：<br />
        <asp:TextBox ID="TextBox1" runat="server" Height="177px" TextMode="MultiLine" Width="794px"></asp:TextBox>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:Label ID="Label6" runat="server" Text="111" Visible="False"></asp:Label>
        <asp:Panel ID="Panel3" runat="server" Height="31px" HorizontalAlign="Center">
            <asp:Button ID="Button1" runat="server" Height="28px" Text="确定" Width="57px" OnClick="Button1_Click" />
        </asp:Panel>
        <br />
        <br />
        <br />
        <br />

 评论：<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Cmt_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                
                <asp:BoundField DataField="Cmt_UserName"  SortExpression="Cmt_UserName" />
                <asp:HyperLinkField  Text="：" />
                <asp:BoundField DataField="Cmt_Content"  SortExpression="Cmt_Content" ItemStyle-Width="200px">
                
<ItemStyle Width="200px"></ItemStyle>
                </asp:BoundField>
                
                <asp:BoundField DataField="Cmt_Time"  SortExpression="Cmt_Time" ItemStyle-Width="100px" ItemStyle-Height="100" >
               
               
<ItemStyle Height="100px" Width="100px"></ItemStyle>
                </asp:BoundField>
               
               
                  <asp:HyperLinkField  Text="回复" DataNavigateUrlFields="Cmt_ID" DataNavigateUrlFormatString="commentreply.aspx?Cmt_ID={0}" ItemStyle-Width="100px" >
<ItemStyle Width="100px"></ItemStyle>
                </asp:HyperLinkField>
             <asp:BoundField DataField="reply"  SortExpression="reply" ItemStyle-Width="200px" >
<ItemStyle Width="200px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="reply_time"  SortExpression="reply_time" ItemStyle-Width="100px">

<ItemStyle Width="100px"></ItemStyle>
                </asp:BoundField>

            </Columns>
          
            
            
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
          
            
            
        </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BlogConnectionString %>" SelectCommand="SELECT * FROM [Comments] WHERE ([ArticleID] = @ArticleID) ORDER BY [Cmt_Time] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label6" Name="ArticleID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        </asp:Panel>

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
            layui.use('element', function () {
            var element = layui.element;
        });
    </script>
   
</body>
</html>
