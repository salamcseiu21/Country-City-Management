<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CountryCityInformationManagementSystem.UI.Home" EnableEventValidation="false" ValidateRequest="false"%>

<head>
    <title>Country Informaitn of the World</title>
    <link rel="shortcut icon" type="x-large icon" href="~/Images/app.ico"/>
    <link href="../Styles/Main.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
    <form runat="server">
        

            <header>
                <div class="logo" id="textId">
                    <img src="../Images/sun.gif" />
                </div>
                <div class="banner" id="bannerId">
                    
                </div>
            </header>
            <div class="mainContent">
                
                <aside>
                    <section>
                        
                   <h2>Operstions</h2>
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/UI/AddCountryUI.aspx">Add Country</asp:LinkButton><br /><br/>
                    <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/UI/AddCityUI.aspx">Add City</asp:LinkButton><br /><br/>
                    <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/UI/CountryViewUI.aspx">View Country</asp:LinkButton><br /><br/>
                    <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/UI/CityViewUI.aspx">View City</asp:LinkButton>
                         </section>
                </aside>
                <div class="content">
                   
                   <section>
                        <article>
                        <h2>How many countries are there in the world?</h2>
                            
  <p>Since South Sudan became an independent state on 9 July 2011, there are now 195 independent sovereign states in the world (including disputed but defacto independent Taiwan), plus about 60 dependent areas, and five disputed territories, like Kosovo. </p>
                    </article>
                   </section>
                    <section>
                        <article>
                            <h2> List of Coutnries</h2>
                            <p>This is a <a href="https://simple.wikipedia.org/wiki/List_of_countries">list of countries</a> and areas in the world in alphabetical order, with the official names and alternative names.
English and French country names as well as local names of the countries.
                                Links will lead you to the respective One World - Nations Online country information and internet resources page(Wikipedia). 
                            </p>
                        </article>
                    </section>
                    <section>
                        <article>
                            <h2>Something</h2>
                            <p>Each country profile provides links to official web sites of a nation/territory, information on geography, maps, the national flag, history, culture, tourist destinations, its population and languages, the capital and the largest cities, education, economy and much more.</p>
                        </article>
                    </section>

                
            </div>
            <footer>
                <p>&copy;All right reserved by Developer...</p>
            </footer>
        </div>
    </form>
        </div>
</body>

