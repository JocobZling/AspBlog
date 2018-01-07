<%@ Page Language="C#" AutoEventWireup="true" CodeFile="usersearchArticle.aspx.cs" Inherits="searchAriticle" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/StyleSheet.css" rel="Stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server"><center>
    <div id="head">
        <img src="images/backgrounds/2.jpg" height="300" alt="head"/>
    </div>
    <div id="body">
    
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="搜索" />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label> 
    
        <asp:HyperLink ID="HyperLink1" runat="server"></asp:HyperLink>
        <asp:Label ID="Label2" runat="server"></asp:Label>
    
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BlogConnectionString %>" DeleteCommand="DELETE FROM [Articles] WHERE [ArticleID] = @ArticleID" InsertCommand="INSERT INTO [Articles] ([ArticleID], [Title], [PublishedTime], [Tag_ID], [ViewNum], [imgUrl]) VALUES (@ArticleID, @Title, @PublishedTime, @Tag_ID, @ViewNum, @imgUrl)" SelectCommand="SELECT [ArticleID], [Title], [PublishedTime], [Tag_ID], [ViewNum], [imgUrl] FROM [Articles] ORDER BY [ArticleID]" UpdateCommand="UPDATE [Articles] SET [Title] = @Title, [PublishedTime] = @PublishedTime, [Tag_ID] = @Tag_ID, [ViewNum] = @ViewNum, [imgUrl] = @imgUrl WHERE [ArticleID] = @ArticleID">
            <DeleteParameters>
                <asp:Parameter Name="ArticleID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ArticleID" Type="Int32" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="PublishedTime" Type="DateTime" />
                <asp:Parameter Name="Tag_ID" Type="Int32" />
                <asp:Parameter Name="ViewNum" Type="Int32" />
                <asp:Parameter Name="imgUrl" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="PublishedTime" Type="DateTime" />
                <asp:Parameter Name="Tag_ID" Type="Int32" />
                <asp:Parameter Name="ViewNum" Type="Int32" />
                <asp:Parameter Name="imgUrl" Type="String" />
                <asp:Parameter Name="ArticleID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ArticleID" DataSourceID="SqlDataSource1" PageSize="5">
            <Columns>
                <asp:BoundField DataField="ArticleID" HeaderText="ArticleID" ReadOnly="True" SortExpression="ArticleID" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="PublishedTime" HeaderText="PublishedTime" SortExpression="PublishedTime" />
                <asp:BoundField DataField="Tag_ID" HeaderText="Tag_ID" SortExpression="Tag_ID" />
                <asp:BoundField DataField="ViewNum" HeaderText="ViewNum" SortExpression="ViewNum" />
                <asp:BoundField DataField="imgUrl" HeaderText="imgUrl" SortExpression="imgUrl" />
            </Columns>
        </asp:GridView>
    
    </div>
    <div id="tail">
    <img src="images/backgrounds/1.jpg" height="300" alt="head"/>
    </div>
    </form></center>
</body>
</html>
