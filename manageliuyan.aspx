<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manageliuyan.aspx.cs" Inherits="manageliuyan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>管理留言</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
    <link href="style/manageIndex.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style type="text/css">
        a {
            text-align: center;
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
                        <li class="layui-nav-item layui-this"><a href="manageIndex.aspx">管理文章和评论</a></li>
                        <li class="layui-nav-item "><a href="addArticle.aspx">添加文章</a></li>
                        <li class="layui-nav-item"><a href="manageliuyan.aspx">管理留言</a></li>
                        <li class="layui-nav-item">
                            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">退出</asp:LinkButton></li>
                    </ul>
                </div>
            </div>
        </header>
        <script>
            layui.use('element', function () {
                var element = layui.element;
            });
        </script>


        <div style="margin-top:30px">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BlogConnectionString %>" SelectCommand="SELECT * FROM [Messages] ORDER BY [AddDate] DESC" DeleteCommand="DELETE FROM [Messages] WHERE [Msg_ID] = @Msg_ID" InsertCommand="INSERT INTO [Messages] ([Msg_ID], [Msg_Title], [Msg_Content], [Msg_User], [AddDate], [Reply], [ReplyData], [Msg_ToUser]) VALUES (@Msg_ID, @Msg_Title, @Msg_Content, @Msg_User, @AddDate, @Reply, @ReplyData, @Msg_ToUser)" UpdateCommand="UPDATE [Messages] SET [Msg_Title] = @Msg_Title, [Msg_Content] = @Msg_Content, [Msg_User] = @Msg_User, [AddDate] = @AddDate, [Reply] = @Reply, [ReplyData] = @ReplyData, [Msg_ToUser] = @Msg_ToUser WHERE [Msg_ID] = @Msg_ID">
            <DeleteParameters>
                <asp:Parameter Name="Msg_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Msg_ID" Type="Int32" />
                <asp:Parameter Name="Msg_Title" Type="String" />
                <asp:Parameter Name="Msg_Content" Type="String" />
                <asp:Parameter Name="Msg_User" Type="String" />
                <asp:Parameter Name="AddDate" Type="DateTime" />
                <asp:Parameter Name="Reply" Type="String" />
                <asp:Parameter Name="ReplyData" Type="DateTime" />
                <asp:Parameter Name="Msg_ToUser" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Msg_Title" Type="String" />
                <asp:Parameter Name="Msg_Content" Type="String" />
                <asp:Parameter Name="Msg_User" Type="String" />
                <asp:Parameter Name="AddDate" Type="DateTime" />
                <asp:Parameter Name="Reply" Type="String" />
                <asp:Parameter Name="ReplyData" Type="DateTime" />
                <asp:Parameter Name="Msg_ToUser" Type="String" />
                <asp:Parameter Name="Msg_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Msg_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" HorizontalAlign="Center" PageSize="5">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Msg_User" SortExpression="Msg_User" />

                <asp:HyperLinkField Text="：" />
                <asp:BoundField DataField="Msg_Title" SortExpression="Msg_Title" ItemStyle-Width="150px" ItemStyle-Height="50">
                    <ItemStyle Height="50px" Width="150px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Msg_Content" SortExpression="Msg_Content" ItemStyle-Width="150px" ItemStyle-Height="50">


                    <ItemStyle Height="50px" Width="150px"></ItemStyle>
                </asp:BoundField>


                <asp:BoundField DataField="AddDate" SortExpression="AddDate" ItemStyle-Width="100px" ItemStyle-Height="100">
                    <ItemStyle Height="100px" Width="100px"></ItemStyle>
                </asp:BoundField>

                <asp:BoundField DataField="Reply" SortExpression="Reply" ItemStyle-Width="150px" ItemStyle-Height="50">
                    <ItemStyle Height="50px" Width="150px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="ReplyData" SortExpression="ReplyData" ItemStyle-Width="100px">


                    <ItemStyle Width="100px"></ItemStyle>
                </asp:BoundField>


            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#009688" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#009688" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#009688" ForeColor="White" HorizontalAlign="Center" />
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
</body>
</html>
