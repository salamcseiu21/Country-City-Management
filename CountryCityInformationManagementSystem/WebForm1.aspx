<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CountryCityInformationManagementSystem.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="1" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="Id">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="About">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("About") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            
        </asp:GridView>
    
        <br />
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>' Enabled='<%#Eval("Enabled") %>' OnClick="LinkButton_OnClick">LinkButton</asp:LinkButton>
            </ItemTemplate>
        </asp:Repeater>
    
    </div>
    </form>
</body>
</html>
