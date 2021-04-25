using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using WebApplication1ML.Model;




namespace WebApplication1
{
    public partial class PricePrediction : System.Web.UI.Page
    {
       
        DataTable dt = new DataTable();
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            fillcarname();
            fillCompanyname();
            fillyear();
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Create single instance of sample data from first line of dataset for model input
            ModelInput sampleData = new ModelInput()
            {
              
                Name = carname.SelectedItem.Text,
                Company = company.SelectedItem.Text,
                Year = float.Parse(year.SelectedItem.Value),
                Kms_driven = float.Parse(kilometer.Text),
                Fuel_type = fuletype.SelectedItem.Text,
            };

            // Make a single prediction on the sample data and print results
            var predictionResult = ConsumeModel.Predict(sampleData);

            Response.Write("<script>alert('Predicted Price:Rs ."+predictionResult.Score+"')</script>");
            
           
          
        }


        void fillcarname()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT name from priceprediction;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                carname.DataSource = dt;
                carname.DataValueField = "name";
                carname.DataBind();


            }
            catch (Exception ex)
            {

            }
        }
        void fillCompanyname()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT company from priceprediction;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                company.DataSource = dt;
                company.DataValueField = "company";
                company.DataBind();


            }
            catch (Exception ex)
            {

            }
        }
        void fillyear()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT year from priceprediction;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                year.DataSource = dt;
                year.DataValueField = "year";
                year.DataBind();


            }
            catch (Exception ex)
            {

            }
        }
     
      
    }
}