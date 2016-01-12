<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCityUI.aspx.cs" Inherits="CountryCityInformationManagementSystem.UI.AddCityUI" ValidateRequest="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Country Informaitn of the World</title>
    <link rel="shortcut icon" type="x-large icon" href="~/Images/app.ico" />
    <link href="../Content/font-awesome.css" rel="stylesheet" />
    <link href="../froala_editor_2.0.5/css/froala_editor.css" rel="stylesheet" />
    <link href="../froala_editor_2.0.5/css/froala_style.css" rel="stylesheet" />
    <link href="../froala_editor_2.0.5/css/plugins/colors.css" rel="stylesheet" />
    <link href="../froala_editor_2.0.5/css/plugins/image_manager.css" rel="stylesheet" />
    <link href="../froala_editor_2.0.5/css/plugins/table.min.css" rel="stylesheet" />
    <link href="../froala_editor_2.0.5/css/plugins/file.css" rel="stylesheet" />
    <link href="../froala_editor_2.0.5/css/plugins/image.css" rel="stylesheet" />
    <link href="../Styles/Style.css" rel="stylesheet" />
</head>

<body>
    <div id="cityEntryPage">
        <form runat="server">

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick"></asp:Timer>
                    <asp:Image ID="sliderImage" runat="server" Width="100%" Height="180px" />
                </ContentTemplate>
            </asp:UpdatePanel>


            <fieldset>
                <legend>City Information</legend>
                <table>
                    <tr>
                        <td>Name&nbsp;</td>
                        <td>
                            <asp:TextBox runat="server" ID="nameTextBox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="cityNameRequiredFieldValidator" runat="server" ErrorMessage="City name is eequired!" ControlToValidate="nameTextBox" ForeColor="red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                        </td>
                    </tr>
                    <tr>

                        <td>About&nbsp;</td>
                        <td>
                            <section>
                                <textarea id="edit" runat="server"></textarea>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please! Write something about city" ControlToValidate="edit" ForeColor="red"></asp:RequiredFieldValidator>
                            </section>

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>No of Dewllers&nbsp;</td>
                        <td>
                            <asp:TextBox runat="server" ID="noOfDwellersTextBox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="noDewRequiredFieldValidator" runat="server" ErrorMessage="No of Dwellers is required!" ForeColor="red" ControlToValidate="noOfDwellersTextBox"></asp:RequiredFieldValidator><br />
                            <asp:RegularExpressionValidator ID="noODweRegularExpressionValidator" runat="server" ErrorMessage="Please! Enter numeric figur only" ControlToValidate="noOfDwellersTextBox" ForeColor="red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>Loaction&nbsp;</td>
                        <td>
                            <asp:TextBox runat="server" ID="locationTextBox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="locationRequiredFieldValidator" runat="server" ErrorMessage="Location of City is required!" ForeColor="red" ControlToValidate="locationTextBox"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>Weather&nbsp;</td>
                        <td>
                            <asp:TextBox runat="server" ID="weatherTextBox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="weatherRequiredFieldValidator" runat="server" ErrorMessage="Please! write something about wheather of city" ControlToValidate="weatherTextBox" ForeColor="red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>Country&nbsp;</td>
                        <td>
                            <asp:DropDownList runat="server" ID="countryDropDownList" Width="172px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button runat="server" ID="Button1" Text="Save" OnClick="saveButton_Click" />
                            <asp:Button runat="server" ID="Button2" Text="Cancel" OnClick="CancelButton_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Label runat="server" ID="messageLabel"></asp:Label></td>
                    </tr>
                </table>
            </fieldset>
            <div>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:GridView runat="server" ID="showCityInformationGridView" AutoGenerateColumns="False" AllowPaging="True" PageSize="2" AllowSorting="True" OnPageIndexChanging="showCityInformationGridView_PageIndexChanging" OnPreRender="showCityInformationGridView_PreRender" BorderWidth="1px" Caption="City Information" BorderStyle="None" CaptionAlign="Top" BackColor="White" BorderColor="#999999" CellPadding="3" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                                <asp:TemplateField HeaderText="SL#">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#Eval("CityName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="No. of Dwellers">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#Eval("NoOfDewellers") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Country">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#Eval("CountryName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#000065" />

                        </asp:GridView>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>




            <asp:LinkButton ID="gotToIndexPageLinkButton" runat="server" PostBackUrl="~/UI/Home.aspx" CausesValidation="False">Back</asp:LinkButton>
        </form>

        <script src="../Scripts/jquery-2.1.4.min.js"></script>
        <script src="../froala_editor_2.0.5/js/froala_editor.min.js"></script>
        <script src="../froala_editor_2.0.5/js/plugins/colors.min.js"></script>
        <script src="../froala_editor_2.0.5/js/plugins/font_family.min.js"></script>
        <script src="../froala_editor_2.0.5/js/plugins/font_size.min.js"></script>
        <script src="../froala_editor_2.0.5/js/plugins/image.min.js"></script>
        <script src="../froala_editor_2.0.5/js/plugins/image_manager.min.js"></script>
        <script src="../froala_editor_2.0.5/js/plugins/link.min.js"></script>
        <script src="../froala_editor_2.0.5/js/plugins/lists.min.js"></script>
        <script src="../froala_editor_2.0.5/js/plugins/table.min.js"></script>
        <script src="../froala_editor_2.0.5/js/plugins/url.min.js"></script>
        <script src="../froala_editor_2.0.5/js/plugins/video.min.js"></script>
        <script src="../froala_editor_2.0.5/js/plugins/file.min.js"></script>
        <script src="../froala_editor_2.0.5/js/plugins/paragraph_format.min.js"></script>
        <script src="../froala_editor_2.0.5/js/plugins/save.min.js"></script>
        <script src="../froala_editor_2.0.5/js/plugins/paragraph_style.min.js"></script>
        <script>
            $(function () {
                $('#edit').froalaEditor();
            });
        </script>
        <footer>
            <p>&copy;All right Reserved By Developer......</p>
        </footer>
    </div>
</body>

</html>
