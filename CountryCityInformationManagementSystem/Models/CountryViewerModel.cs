using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CountryCityInformationManagementSystem.Models
{
    public class CountryViewerModel
    {
        public CountryViewerModel(string countryName, string aboutCountry, int noOfCities, int noOfCityDwellers)
        {
            CountryName = countryName;
            AboutCountry = aboutCountry;
            NoOfCities = noOfCities;
            NoOfCityDwellers = noOfCityDwellers;
        }

        public CountryViewerModel()
        {
        }

        public string CountryName { get; set; }
        public string AboutCountry { get; set; }
        public int NoOfCities { get; set; }
        public int NoOfCityDwellers { set; get;     }
    }
}