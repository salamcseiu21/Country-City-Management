using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using CountryCityInformationManagementSystem.DAL;
using CountryCityInformationManagementSystem.Models;

namespace CountryCityInformationManagementSystem
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        CountryGateway countryGateway=new CountryGateway();
        List<Country> countries=new List<Country>(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int totalRows = 0;
                countries = countryGateway.GetAll(0, GridView1.PageSize, out totalRows);
                GridView1.DataSource = countries;
                GridView1.DataBind();

                DataBindRipeter(0, GridView1.PageSize, totalRows);
            }
        }

        private void DataBindRipeter(int pageIndex, int pageSize, int totalRows)
        {
            int totalPages = totalRows / pageSize;
            if ((totalRows % pageSize) != 0)
            {
                totalPages += 1;
            }
            List<ListItem> pageList = new List<ListItem>();
            if (totalPages > 1)
            {
                for (int i = 1; i <= totalPages; i++)
                {
                    pageList.Add(new ListItem(i.ToString(), i.ToString(), i != (pageIndex + 1)));
                }
            }
            Repeater1.DataSource = pageList;
            Repeater1.DataBind();


        }

        protected void LinkButton_OnClick(object sender, EventArgs e)
        {
            int totalRows = 0;
            int pageIndex = int.Parse((sender as LinkButton).CommandArgument);
            pageIndex -= 1;
            GridView1.PageIndex = pageIndex;
            countries = countryGateway.GetAll(pageIndex, GridView1.PageSize, out totalRows);
            GridView1.DataSource = countries;
            GridView1.DataBind();
            DataBindRipeter(pageIndex, GridView1.PageSize, totalRows);
        }
    }
}