<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="CountryViewUI.aspx.cs" Inherits="CountryCityInformationManagementSystem.UI.CountryViewUI" EnableEventValidation="false" ValidateRequest="false" %>

<html>
<head>
    <title>Country Informaitn of the World</title>
    <link rel="shortcut icon" type="x-large icon" href="~/Images/app.ico"/>
    <link href="../Styles/Style.css" rel="stylesheet" />
</head>
<body>
    <div id="countryViewPage">
        
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick"></asp:Timer>
                <asp:Image ID="sliderImage" runat="server" Width="100%" Height="180px" />
            </ContentTemplate>
        </asp:UpdatePanel>

            <fieldset>
                <legend>Search</legend>
                <asp:Label runat="server" Text="Name"></asp:Label>
                <asp:TextBox runat="server" ID="searchTextBox"></asp:TextBox>
                <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" />

                <br />
                <br />
                <asp:GridView ID="showCuntryInformationGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanging="showCuntryInformationGridView_PageIndexChanging" PageSize="3" EnableViewState="False">

                    <AlternatingRowStyle BackColor="White" />
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                    <Columns>
                        <asp:TemplateField HeaderText="SL#">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("CountryName")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="About">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("AboutCountry")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total City">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("NoOfCities")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Dwellers">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("NoOfCityDwellers")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </fieldset>
        <asp:HyperLink ID="goToIdexPageHyperLink" runat="server" NavigateUrl="~/UI/Home.aspx">Back</asp:HyperLink>
    </form>
    <footer>
        <p>&copy;All right Reserved By Developer......</p>
    </footer>
 </div>
</body>
</html>
