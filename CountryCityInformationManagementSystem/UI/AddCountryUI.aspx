<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCountryUI.aspx.cs" Inherits="CountryCityInformationManagementSystem.UI.AddCountryUI" ValidateRequest="false" EnableEventValidation="false" %>

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
    <link href="../froala_editor_2.0.5/css/plugins/file.css" rel="stylesheet" />
    <link href="../froala_editor_2.0.5/css/plugins/image_manager.css" rel="stylesheet" />
    <link href="../froala_editor_2.0.5/css/plugins/image.css" rel="stylesheet" />
    <link href="../froala_editor_2.0.5/css/plugins/table.css" rel="stylesheet" />
    <link href="../froala_editor_2.0.5/css/plugins/video.css" rel="stylesheet" />
    <link href="../froala_editor_2.0.5/css/plugins/line_breaker.min.css" rel="stylesheet" />
    <link href="../Styles/Style.css" rel="stylesheet" />
</head>

<body>
    <div class="countryEntryPage">
        <form runat="server">

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick"></asp:Timer>
                    <asp:Image ID="sliderImage" runat="server" Width="100%" Height="180px" />
                </ContentTemplate>
            </asp:UpdatePanel>

            <fieldset style="width: 910px">
                <legend>Country Information</legend>
                <table>
                    <tr>
                        <td>Name</td>
                        <td>
                            <asp:TextBox ID="nameTextBox" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="nameRequiredFieldValidator" runat="server" ErrorMessage="Country Name is required!" ControlToValidate="nameTextBox" ForeColor="red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>About</td>
                        <td>
                            <section>
                                <textarea id="edit" runat="server"></textarea>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please! Write somthing about Country!" ControlToValidate="edit" ForeColor="red"></asp:RequiredFieldValidator>
                            </section>
                        </td>

                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click" Style="height: 26px" />
                            <asp:Button ID="cancelButton" runat="server" Text="Cancel" OnClick="cancelButton_Click" CausesValidation="False" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Label runat="server" ID="messageLabel"></asp:Label></td>
                    </tr>
                </table>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="showCountryInformationGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" PageSize="2" Caption="Country Information" CaptionAlign="Top" Font-Names="Times New Roman" OnPageIndexChanging="showCountryInformationGridView_PageIndexChanging" EnableModelValidation="False" EnableViewState="False">
                            <Columns>
                                <asp:TemplateField HeaderText="SL#">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
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
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#330099" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                            <SortedAscendingCellStyle BackColor="#FEFCEB" />
                            <SortedAscendingHeaderStyle BackColor="#AF0101" />
                            <SortedDescendingCellStyle BackColor="#F6F0C0" />
                            <SortedDescendingHeaderStyle BackColor="#7E0000" />
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </fieldset>


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

        <script>
            $(function () {
                $('#edit').froalaEditor({
                    heightMin: 100,
                    heightMax: 200
                });
            });
        </script>
        <footer>
            <p>&copy;All right Reserved By Developer......</p>
        </footer>
    </div>
</body>

</html>
