<%@ Page Language="C#" AutoEventWireup="true" CodeFile="liuyan.aspx.cs" Inherits="liuyan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>body{text-align:center}</style>
</head>
<body style="background-image:url(2.jpg)" >
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BlogConnectionString %>" SelectCommand="SELECT * FROM [Messages] WHERE ([Msg_ToUser] = @Msg_ToUser) ORDER BY [AddDate] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" Name="Msg_ToUser" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Msg_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Msg_User" SortExpression="Msg_User" />
               
                <asp:HyperLinkField  Text="：" />
                <asp:BoundField DataField="Msg_Title" SortExpression="Msg_Title"  ItemStyle-Width="150px" ItemStyle-Height="50">
<ItemStyle Height="50px" Width="150px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Msg_Content" SortExpression="Msg_Content" ItemStyle-Width="150px" ItemStyle-Height="50">
                
                
<ItemStyle Height="50px" Width="150px"></ItemStyle>
                </asp:BoundField>
                
                
                <asp:BoundField DataField="AddDate" SortExpression="AddDate" ItemStyle-Width="100px" ItemStyle-Height="100"> 
<ItemStyle Height="100px" Width="100px"></ItemStyle>
                </asp:BoundField>
                <asp:HyperLinkField  Text="回复" DataNavigateUrlFields="Msg_ID" DataNavigateUrlFormatString="messagereply.aspx?Msg_ID={0}" ItemStyle-Width="100px" ItemStyle-Height="50">
<ItemStyle Height="50px" Width="100px"></ItemStyle>
                </asp:HyperLinkField>
                <asp:BoundField DataField="Reply" SortExpression="Reply" ItemStyle-Width="150px" ItemStyle-Height="50">
<ItemStyle Height="50px" Width="150px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="ReplyData" SortExpression="ReplyData" ItemStyle-Width="100px">
               
                
<ItemStyle Width="100px"></ItemStyle>
                </asp:BoundField>
               
                
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Panel ID="Panel1" runat="server" Height="41px" HorizontalAlign="Center">
            <asp:Button ID="Button1" runat="server" BorderColor="#66FFFF" Height="32px" OnClick="Button1_Click" style="margin-left: 22px" Text="添加新留言" Width="104px" />
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
