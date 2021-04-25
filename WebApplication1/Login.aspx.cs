using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from Login where username='" + TextBox1.Text.Trim() + "'AND password='" + TextBox2.Text.Trim() + "' ", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('welcome  " + dr.GetValue(1).ToString() + "')</script>");
                        Session["username"] = dr.GetValue(1).ToString();
                        Session["role"] = "user";
                        Response.Redirect("Home.aspx");
                    }
                }
                else
                {
                    Response.Write("<script>alert(' Invalidate username or password')</script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
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
                SqlCommand cmd = new SqlCommand("select * from AdminLogin where username='" + TextBox1.Text.Trim() + "'AND password='" + TextBox2.Text.Trim() + "' ", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('welcome  " + dr.GetValue(1).ToString() + "')</script>");
                        Session["username"] = dr.GetValue(1).ToString();
                        Session["role"] = "Admin";
                        Response.Redirect("Home.aspx");

                    }
                }
                else
                {
                    Response.Write("<script>alert(' Invalidate username or password')</script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

    }
}