using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using CountryCityInformationManagementSystem.BLL;
using CountryCityInformationManagementSystem.Models;

namespace CountryCityInformationManagementSystem.UI
{
    public partial class CityViewUI : System.Web.UI.Page
    {
        private List<CityViewerModel> cityViewerModels = null;
        CountryManager countryManager=new CountryManager();
        CityManager cityManager=new CityManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAllCountry();
                SetImageUrl();
                LoadAllCityInformation(); 
            }
            LoadAllCityInformation(); 
            //cityInformationGridView.DataSource = cityViewerModels;
            //cityInformationGridView.DataBind();
        }

        private void LoadAllCountry()
        {
            
            List<Country> countries = countryManager.GetAll();
            countryDropDownList.DataSource = countries;
            countryDropDownList.DataValueField = "Id";
            countryDropDownList.DataTextField = "Name";
            countryDropDownList.DataBind();
        }

        private void LoadAllCityInformation()
        {
            
            cityViewerModels = cityManager.GetCityInformation();
            cityInformationGridView.DataSource = cityViewerModels;
            cityInformationGridView.DataBind();
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            cityViewerModels = new List<CityViewerModel>();
            foreach (ListItem item in serarchKeyRadioButton.Items)
            {
                if (item.Selected)
                {
                    if (item.Value == "City Name")
                    {
                        string cityName = cityNameTextBox.Text;
                        cityViewerModels.Clear();
                        cityViewerModels = cityManager.GetCityInformation(cityName);
                       //// ViewState["cityList"] = cityViewerModels;
                       //// Session["countryList"] = cityViewerModels;
                        cityInformationGridView.DataSource = cityViewerModels;
                        cityInformationGridView.DataBind();
                    }
                    else if (item.Value == "Country")
                    {
                        string countryName = countryDropDownList.SelectedItem.Text;
                        cityViewerModels.Clear();
                        cityViewerModels = cityManager.GetCityInformationByCountryName(countryName);
                         //Session["countryList"] = cityViewerModels;
                        //// ViewState["cityList"] = cityViewerModels;
                        cityInformationGridView.DataSource = cityViewerModels;
                        cityInformationGridView.DataBind();
                    }
                }
            }
        }

      
        protected void cityInformationGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            cityInformationGridView.PageIndex = e.NewPageIndex;
            //Session["countryList"] = cityViewerModels;
            cityInformationGridView.DataSource = cityViewerModels;
            cityInformationGridView.DataBind();
            //ViewState["cityList"] = cityViewerModels;
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