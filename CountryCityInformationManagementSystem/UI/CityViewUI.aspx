<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="CityViewUI.aspx.cs" Inherits="CountryCityInformationManagementSystem.UI.CityViewUI" EnableEventValidation="false" ValidateRequest="false" %>

<head>
    <title>Country Informaitn of the World</title>
    <link rel="shortcut icon" type="x-large icon" href="~/Images/app.ico"/>
    <link href="../Styles/Style.css" rel="stylesheet" />
</head>
<body>
    <div id="cityViewPage">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick"></asp:Timer>
                <asp:Image ID="sliderImage" runat="server" Width="100%" Height="180px" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <div id="searchSection">
            <fieldset style="width: 271px">
                <legend>Search Criteria</legend>
                <div style="float: left;">
                    <asp:RadioButtonList ID="serarchKeyRadioButton" runat="server">
                        <asp:ListItem Value="1">City Name</asp:ListItem>
                        <asp:ListItem Value="2">Country</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div>
                    <br />

                    <asp:TextBox ID="cityNameTextBox" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:DropDownList ID="countryDropDownList" runat="server" Width="172px"></asp:DropDownList>
                </div>

                <div style="float: right">
                    <br />
                    <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" />
                </div>

            </fieldset>
        </div>

        <div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    
            

            <asp:GridView runat="server" ID="cityInformationGridView" AutoGenerateColumns="False" AllowPaging="True" PageSize="2" OnPageIndexChanging="cityInformationGridView_PageIndexChanging" Caption="City Information">
                <Columns>
                    <asp:TemplateField HeaderText="SL#">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City Name">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("CityName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="About">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("AboutCity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="No. of Dwellers">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("NoOfDewellers") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Location">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("Location") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Weather">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("Weather") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("CountryName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="About Country">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("AboutCountry") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                        </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <asp:HyperLink ID="goToIdexPageHyperLink" runat="server" NavigateUrl="~/UI/Home.aspx">Back</asp:HyperLink>

    </form>
    <footer>
        <p>&copy;All right Reserved By Developer......</p>
    </footer>
        </div>
</body>
