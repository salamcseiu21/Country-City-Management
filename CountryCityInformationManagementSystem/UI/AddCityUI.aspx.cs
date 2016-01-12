using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryCityInformationManagementSystem.BLL;
using CountryCityInformationManagementSystem.Models;

namespace CountryCityInformationManagementSystem.UI
{
    public partial class AddCityUI :Page
    {
        CountryManager countryManager = new CountryManager();
        CityManager cityManager = new CityManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillDropDownListWithCountryInfomation();
                SetImageUrl();
            }
            LoadAllCity();
        }

        private void FillDropDownListWithCountryInfomation()
        {
            List<Country> countries = countryManager.GetAll();
            countryDropDownList.DataSource = countries;
            countryDropDownList.DataTextField = "Name";
            countryDropDownList.DataValueField = "Id";
            countryDropDownList.DataBind();
        }

        private void LoadAllCity()
        {
            List<CityViewerModel> cityViewerModels = cityManager.GetCityInformation();
            showCityInformationGridView.DataSource = cityViewerModels;
            showCityInformationGridView.DataBind();
        }
        protected void saveButton_Click(object sender, EventArgs e)
        {
            try
            {
                string name = nameTextBox.Text;
                string about = Request.Form["edit"];
                int noOfDwellers = Convert.ToInt32(noOfDwellersTextBox.Text);
                string location = locationTextBox.Text;
                string weather = weatherTextBox.Text;
                int countryId = Convert.ToInt32(countryDropDownList.SelectedValue);
                City aCity = new City(name, about, noOfDwellers, location, weather, countryId);
                string message = cityManager.Save(aCity);
                messageLabel.Text = message;
                LoadAllCity();
                ClearAllTextBoxes();
            }
            catch (Exception exception)
            {

                string mgs = exception.Message;
                if (exception.InnerException != null)
                {
                    mgs += "<br/>System Error:" + exception.InnerException.Message;
                }
                messageLabel.Text = mgs;
            }

        }
        private void ClearAllTextBoxes()
        {
            nameTextBox.Text = string.Empty;
            noOfDwellersTextBox.Text = string.Empty;
            locationTextBox.Text = string.Empty;
            weatherTextBox.Text = string.Empty;
            edit.InnerText = "";
        }



        protected void showCityInformationGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            showCityInformationGridView.PageIndex = e.NewPageIndex;
        }

        protected void showCityInformationGridView_PreRender(object sender, EventArgs e)
        {
          
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
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