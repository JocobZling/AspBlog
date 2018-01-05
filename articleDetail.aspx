<%@ Page Language="C#" AutoEventWireup="true" CodeFile="articleDetail.aspx.cs" Inherits="articleDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>查看文章</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <link href="style/articleDetail.css" rel="stylesheet">
    <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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
</body>
</html>
