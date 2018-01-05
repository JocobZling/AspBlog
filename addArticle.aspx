<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addArticle.aspx.cs" Inherits="addArticle" validateRequest="false" Debug="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>添加博客</title>
    <script src="ckeditor/ckeditor.js" type="text/javascript"></script>
    <script src="ckeditor/config.js" type="text/javascript"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <link href="style/addArticle.css" rel="stylesheet">
    <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
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
</body>
</html>
