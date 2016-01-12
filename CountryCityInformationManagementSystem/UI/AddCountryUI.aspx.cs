using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using CountryCityInformationManagementSystem.BLL;
using CountryCityInformationManagementSystem.Models;

namespace CountryCityInformationManagementSystem.UI
{
    public partial class AddCountryUI : System.Web.UI.Page
    {
        CountryManager countryManager = new CountryManager();
        List<Country> countryList = new List<Country>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetImageUrl();  
            }
            LoadAllCountryInformation();
        }

        private void LoadAllCountryInformation()
        {
            countryList = countryManager.GetAll();
            showCountryInformationGridView.DataSource = countryList;
            showCountryInformationGridView.DataBind();
        }
        protected void saveButton_Click(object sender, EventArgs e)
        {


            try
            {
                if (nameTextBox.Text != "")
                {
                    messageLabel.Text = "";
                    string name = nameTextBox.Text;
                    string about = Request.Form["edit"];
                    Country country = new Country(name, about);
                    string message = countryManager.Save(country);
                    messageLabel.Text = message;
                    ClearAll();
                    LoadAllCountryInformation();
                }

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

        private void ClearAll()
        {
            nameTextBox.Text = "";
           // Request.Form["edit"] = "";
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

        protected void showCountryInformationGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            showCountryInformationGridView.PageIndex = e.NewPageIndex;
            showCountryInformationGridView.DataSource = countryList;
            showCountryInformationGridView.DataBind();

        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {
            ClearAll();
        }

    }
}