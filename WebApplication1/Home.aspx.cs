using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using AjaxControlToolkit;
namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillcarname();
              



            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update  Car_detail set Username=@USERNAME,Feedback=@Feedback,Rating=@ratingvalue  where Car_name='" + Car.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@USERNAME", UserName.Text.Trim());
                cmd.Parameters.AddWithValue("@Feedback", Feedback.Text.Trim());

                cmd.Parameters.AddWithValue("@ratingvalue", Rating.CurrentRating.ToString());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Feedback Recorded Sucessfull')</script>");


            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
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
                SqlCommand cmd = new SqlCommand("SELECT Car_name from Car_detail;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Car.DataSource = dt;
                Car.DataValueField = "Car_name";
                Car.DataBind();


            }
            catch (Exception ex)
            {

            }
        }
        //private void BindDataList()
        //{

        //    using (SqlConnection con = new SqlConnection(strcon))
        //    {
        //        SqlCommand cmd = new SqlCommand("SELECT Car_name,Std,Lux,Car_img,Feedback,rating FROM Car_detail; ", con);
               
        //        con.Open();
        //        DataList1.DataSource = cmd.ExecuteReader();
        //        DataList1.DataBind();
        //    }



        //}
    }
}