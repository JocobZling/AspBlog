<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mycomment.aspx.cs" Inherits="mycomment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     
</head>
<body style="background-image:url(2.jpg)">
    <form id="form1" runat="server">
    <div style="text-align:center; height: 296px;" >
    
        评论内容：<br />
        <asp:TextBox ID="TextBox1" runat="server" Height="177px" TextMode="MultiLine" Width="794px"></asp:TextBox>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Panel ID="Panel1" runat="server" Height="31px" HorizontalAlign="Center">
            <asp:Button ID="Button1" runat="server" Height="28px" OnClick="Button1_Click" Text="确定" Width="57px" />
        </asp:Panel>
        <br />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
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
                <asp:ControlParameter ControlID="Label1" Name="ArticleID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
