using System;
using System.Collections.Generic;
using System.Web.UI;
using CountryCityInformationManagementSystem.BLL;
using CountryCityInformationManagementSystem.Models;

namespace CountryCityInformationManagementSystem.UI
{
    public partial class CountryViewUI : Page
    {
        CityManager cityManager=new CityManager();
        private List<CountryViewerModel> countryList = null; 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetImageUrl();
            }
            LoadCountryInformation();
        }

        private void LoadCountryInformation()
        {
            countryList = new List<CountryViewerModel>();
            countryList = cityManager.GetCountryInformation();
            showCuntryInformationGridView.DataSource = countryList;
            showCuntryInformationGridView.DataBind();
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            string name = searchTextBox.Text;
           
            countryList = cityManager.GetCountryInformationByName(name);
            showCuntryInformationGridView.DataSource = countryList;
            showCuntryInformationGridView.DataBind();
        }

        protected void showCuntryInformationGridView_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        {
            showCuntryInformationGridView.PageIndex = e.NewPageIndex;
            showCuntryInformationGridView.DataSource = countryList;
            showCuntryInformationGridView.DataBind();
        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            SetImageUrl();
        }

        private void SetImageUrl()
        {
            Random random = new Random();
            int i = random.Next(1, 12);
            sliderImage.ImageUrl = "../Images/" + i + ".jpg";
        }
    }
}