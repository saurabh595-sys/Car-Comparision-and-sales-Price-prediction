using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Accessories_Add : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        //Accessories_Add
        protected void Button1_Click(object sender, EventArgs e)
        {
            Accessoriesadd();
        }
        //Accessories_update
        protected void Button2_Click(object sender, EventArgs e)
        {
            update();
        }
        void Accessoriesadd()
        {


            try
            {
                string filepath = "~/Img/Add.png";
                string filename = Path.GetFileName(Accessories_img.PostedFile.FileName);
                if (filename == "" || filename == null)
                {
                    filepath = global_filepath;

                }
                else
                {
                    Accessories_img.SaveAs(Server.MapPath("Img/" + filename));
                    filepath = "~/Car_Image/" + filename;
                }


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into Accessories(image,Accessories_id,Accessories_Name,Category,Product_description)values(@image,@Accessories_ID,@Accessories_Name,@Category,@Description) ", con);
                cmd.Parameters.AddWithValue("@Accessories_ID", Accessories_ID.Text.Trim());
                cmd.Parameters.AddWithValue("@Accessories_Name", Accessories_Name.Text.Trim());
              
                cmd.Parameters.AddWithValue("@Description", Description.Text.Trim());
                cmd.Parameters.AddWithValue("@Category", Category.SelectedItem.Value);
            
                cmd.Parameters.AddWithValue("@image", filepath);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Accessories Added Sucessfull')</script>");


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void update()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE Accessories set Accessories_Name=@Accessories_Name,Category=@Category,Product_description=@Description where Accessories_id='" + Accessories_ID.Text.Trim() + "'", con);

    
                cmd.Parameters.AddWithValue("@Accessories_Name", Accessories_Name.Text.Trim());

                cmd.Parameters.AddWithValue("@Description", Description.Text.Trim());
                cmd.Parameters.AddWithValue("@Category", Category.SelectedItem.Value);

                


                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('Accessories Data Updated Successfully');</script>");


            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }



        void go()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from Accessories WHERE Accessories_id='" + Accessories_ID.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    Accessories_Name.Text = dt.Rows[0]["Accessories_Name"].ToString();
                    Description.Text = dt.Rows[0]["Product_description"].ToString();
                    Category.SelectedValue = dt.Rows[0]["Category"].ToString().Trim();




                }
                else
                {
                    Response.Write("<script>alert('Invalid Car ID');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
        //go
        protected void Button4_Click(object sender, EventArgs e)
        {
            go();
        }
    }
}